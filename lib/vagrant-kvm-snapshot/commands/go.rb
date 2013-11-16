require_relative 'multi_vm_args'

module VagrantPlugins
  module KvmSnapshot
    module Command
      class Go < Vagrant.plugin(2, :command)
        include MultiVmArgs

        def execute
          options = {}
          options[:reload] = false

          opts = OptionParser.new do |opts|
            opts.banner = "Go to specified snapshot"
            opts.separator ""
            opts.separator "Usage: vagrant snapshot go [vm-name] <SNAPSHOT_NAME>"

            opts.on("-r", "--reload", "Runs 'vagrant reload --no-provision' after restoring snapshot to ensure Vagrantfile config is applied.") do |reload|
              options[:reload] = reload
            end

          end
          # Parse the options
          argv = parse_options(opts)
          return if !argv

          vm_name, snapshot_name = parse_vm_and_snapshot_options(argv, opts)
          return if !snapshot_name

          with_target_vms(vm_name, single_target: true) do |machine|
            vm_id = machine.id

            if machine.state.id != :poweroff
              @env.ui.info("Powering off machine #{vm_id}")
              machine.provider.driver.suspend(machine.id) #XXX halt?
            end

            machine.provider.driver.snapshot(machine.id, :action=>:restore, :arg=>snapshot_name) do |data|
              machine.env.ui.info(data)
            end

            if options[:reload]
              @env.ui.info("Reloading VM, since --reload passed")
              machine.action(:reload, :provision_enabled => false)
            else
              @env.ui.info("Starting restored VM")
              machine.action(:up, :provision_enabled => false)
            end
          end
        end
      end
    end
  end
end
