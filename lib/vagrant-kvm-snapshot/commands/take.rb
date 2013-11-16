require_relative 'multi_vm_args'

module VagrantPlugins
  module KvmSnapshot
    module Command
      class Take < Vagrant.plugin(2, :command)
        include MultiVmArgs

        def execute
          options = {}

          opts = OptionParser.new do |opts|
            opts.banner = "Take snapshot"
            opts.separator ""
            opts.separator "Usage: vagrant snapshot take [vm-name] <SNAPSHOT_NAME>"
          end
          # Parse the options
          argv = parse_options(opts)
          return if !argv

          vm_name, snapshot_name = parse_vm_and_snapshot_options(argv, opts)
          return if !snapshot_name

          with_target_vms(vm_name, single_target: true) do |machine|
            machine.env.ui.info("Taking snapshot #{snapshot_name}")
            machine.provider.driver.snapshot(machine.id, :action=>:take, :name => snapshot_name) do |data|
              machine.env.ui.info(data)
            end
          end
        end
      end
    end
  end
end
