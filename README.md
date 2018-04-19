# Howl
Hypervised OWL build environment for audio DSP patch compilation and deployment

**NOTE: This documentation is not yet valid until the 0.1.x-experimental release. Until then you can use this software at your own risk.**

Howl is a virtual build environment for compiling and deploying audio [](https://)DSP patches for [](https://)Rebel Technologies' programmable Open Ware Laboratory devices like the OWL Modular. The Howl cross compile environment and build tools are self contained in a virtual machine that is run using a Vagrant provider, in this case Virtualbox.

Howl is developed with love by [Happy Thougths Audio](https://www.htaudio.de). Thanks go out to the [guys](https://) from Rebel Technology and the community there for their support in developing Howl.

## Features
* Installer to automate installation of virtual machine
* Howl CLI tool to run compilation and deployment of polyglot audio DSP patches

## Supported Platforms
At this point Howl has only been developed and tested for Mac OSX with Virtualbox. Porting this to other platforms and Vagrant providers should be striaght forward so please do fork this repository and create some pull requests for further platform support. We appreciate your support.

## Dependencies
Prior to installing and running Howl you will have to make sure you have following dependencies installed:
* [](https://)Virtualbox
* [](https://)Vagrant

## Quick Start
Checkout this repository, cd to the root folder of this project and run

	$ ./installer.sh

After the installer has ensured you are running the correct dependencies and has installed the virtual machine you can proceed to boot Howl:
	
	$ ./howl start

If howl has booted you will receive a confirmation. After this confirmation why not run a test to see if everything is working as expected

	$ ./howl test osx/mac-test-armgcc
	$ ./howl test osx/mac-test-firmwaresender

Should your tests be successfull you can go ahead and try compiling your first patch

	$ ./howl compile --language=cpp patches/cpp/GainPatch.hpp

Once compilation is done you should get a confirmation. Power down Howl by running

	$ ./howl stop

## Connecting OWL Devices
Howl can deploy compiled patches and run them on OWL Devices. Make sure your devices is powered and connected to your host computer via USB. If Howl is not running yet, start it and after it is running execute following command:
	
	$ ./howl listdevices

