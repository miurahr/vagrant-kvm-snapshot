begin
    require "vagrant"
rescue LoadError
    raise "The Vagrant KVM Snapshot plugin must be run within Vagrant."
end

module VagrantPlugins
  module KvmSnapshot
    class Plugin < Vagrant.plugin("2")
      name "Vagrant KVM Snapshot"
      description "Vagrant plugin to take snapshot with vagrant-kvm provider."

      command "snapshot" do
        require_relative 'commands/root.rb'
        Command::Root
      end

    end
  end
end
