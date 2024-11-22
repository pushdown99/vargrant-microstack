# -*- mode: ruby -*-
# vi: set ft=ruby :

# https://microstack.run/docs/single-node
# wmic cpu get NumberOfCores,NumberOfLogicalProcessors
# wmic memphysical get maxcapacity
# 
# Requirements
# physical or virtual machine running Ubuntu 22.04 LTS
# a multi-core amd64 processor ideally with 4+ cores
# a minimum of 16 GiB of free memory
# 50 GiB of SSD storage available on the root disk
vm  = "basic.wb9lab.com" # FQDN
box = "boxen/ubuntu-22.04"
host = vm
cpus = 4
memory = 8192
port = 10030
provider = "hyperv"

Vagrant.configure("2") do |config|
  config.vm.define vm do |c|
    c.vm.box = box
    c.vm.hostname = host
    #c.vm.network "private_network", ip: "192.168.56.100"
    c.vm.network "forwarded_port", guest: 22, host: port+1, auto_correct: true, id: "ssh"
    c.vm.synced_folder ".", "/vagrant", disabled: true
    c.vm.provider provider do |v|
      v.vmname = host
      v.cpus = cpus
      v.memory = memory
    end
  end
end