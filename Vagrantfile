# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "htaudio-de/arch-howl"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  config.vm.box_check_update = false

  # set auto_update to false, if you do NOT want to check the correct 
  # additions version when booting this machine
  # config.vbguest.auto_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "./patches", "/howl/patches"
  config.vm.synced_folder "./scripts/howltest", "/howl/tests"
  config.vm.synced_folder "./scripts/howl", "/howl/scripts"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  config.vm.provider "virtualbox" do |vb|
    # Audio box customizations
    # TODO LINUX, WINDOWS
    # Mac OS
    if RUBY_PLATFORM =~ /darwin/
      # Audio
      vb.customize ["modifyvm", :id, '--audio', 'coreaudio', '--audiocontroller', 'hda'] # choices: hda sb16 ac97
      # USB
      vb.customize ["modifyvm", :id, '--usb', 'on']
      vb.customize ["modifyvm", :id, '--usbehci', 'on']
      vb.customize ["usbfilter", "add", "0", 
        "--target", :id, 
        "--name", "Owl Modular",
        "--manufacturer", "Rebel Tech",
        "--product", "OWL-MIDI"]   
    end
  end

  ## Test file copy provisioners - USE THESE ONLY IF YOU ARE BUILDING A NEW HOWL IMAGE AND ARE TESTING WITH NEW PROVISIONERS FOR PACKER
  # config.vm.provision "file", source: "./arm-tlc/gcc-arm-none-eabi-7-2017-q4-major-linux.tar.bz2", destination: "/tmp/arm-tlc.tar.bz2"
  # config.vm.provision "file", source: "./tools/HowlFirmwareSender", destination: "/tmp/firmwaresender"
  # config.vm.provision "shell", path: "./scripts/install-howl-base.sh", privileged: true, env: {"ARM_TLC_PKG" => "arm-tlc.tar.bz2", "ARM_TLC_AR" => "/tmp/arm-tlc.tar.bz2", "ARM_TLC_TGT" => "/opt/howl-tlc/", "FWSNDR_BIN" => "/tmp/firmwaresender", "FWSNDR_TGT" => "/usr/local/bin/"}
  # config.vm.provision "user-sw", type: "shell", path: "./scripts/install-howl-user-sw.sh", privileged: false, env: {"EXPORTS_SH" => "/howl/scripts/exports.sh", "TLC_TOOLROOT" => "/opt/howl-tlc/gcc-arm-none-eabi-7-2017-q4-major/bin"}

end
