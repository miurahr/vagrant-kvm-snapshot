$:.unshift File.expand_path('../lib', __FILE__)
require 'vagrant-kvm-snapshot/version'

Gem::Specification.new do |spec|
  spec.name          = "vagrant-kvm-snapshot"
  spec.version       = VagrantPlugins::KvmSnapshot::VERSION
  spec.authors       = "Hiroshi Miura, Alex Dergachev"
  spec.email         = "miurahr@linux.com"
  spec.summary       = 'Vagrant plugin to take snapshot with vagrant-kvm provider.'
  spec.description   = 'Vagrant plugin to take snapshot with vagrant-kvm provider.'
  spec.homepage      = 'https://github.com/miurahr/vagrant-kvm-snapshot'
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_path  = 'lib'

end
