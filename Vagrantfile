# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.6.5"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Using Puppet Labs official vagrant boxes, from: https://vagrantcloud.com/puppetlabs
  config.vm.provider "virtualbox"
  config.vm.box = "puppetlabs/centos-6.6-32-puppet"

  config.vm.provision :shell, :path => "./.vagrant_puppet/init.sh"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "./.vagrant_puppet"
    puppet.manifest_file  = "init.pp"
    puppet.options = "--verbose"
  end

end
