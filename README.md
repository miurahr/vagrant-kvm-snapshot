vagrant-kvm-snapshot
==================================
Vagrant plugin to take snapshot with vagrant-kvm provider

## Copyright and License

Hiroshi Miura <miurahr@linux.com>
under MIT License

This is a fork of vagrant-vbox-snapshot
  'https://github.com/dergachev/vagrant-vbox-snapshot'
  Copyright, 2013 Alex Dergachev

## Install

Ensure you have Vagrant 1.1+ installed, then run:

    vagrant plugin install vagrant-kvm-snapshot

## Usage

The following commands are added by this plugin:

     vagrant snapshot take [vm-name] [NAME]            # take snapshot, labeled by NAME
     vagrant snapshot list [vm-name]                   # list snapshots
     vagrant snapshot back [vm-name]                   # restore last taken snapshot
     vagrant snapshot delete [vm-name] [NAME]          # delete specified snapshot
     vagrant snapshot go [vm-name] [NAME]              # restore specified snapshot

## Caveats

* It don't work with vagrant-libvirt. If you need this, try [another solution](#other-solutions).

## Other solutions

It support snapshot for virtualbox and libvirt(fog).
* [sahara](https://github.com/jedi4ever/sahara)

