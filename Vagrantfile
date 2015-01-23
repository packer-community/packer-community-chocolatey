# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # config.vm.box = "mfellows/windows2012r2"  
  config.vm.box = "windows2012r2rsync"  
  config.vm.synced_folder ".", "/chocolateypackages"
end