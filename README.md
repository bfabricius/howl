# Howl
Hypervised OWL build environment for audio DSP patch compilation and deployment

Currently Released Version: v0.1.3-experimental

![Howl Logo](https://github.com/bfabricius/howl/blob/master/images/howl.png)

**NOTE: This documentation is not yet complete until the 1.0.0-stable release and is work in progress. Until then functionality documented here might not be implemented yet or might not be working as expected allthough we do try to keep the latest development master branch working if possible.**

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

Should your tests be successfull you can go ahead and try compiling and run your first patch. With your OWL device connected, run

	$ ./howl build --name=Gain --lang=cpp --run cpp/GainPatch.hpp

Once compilation is done you should get a confirmation. Power down Howl by running

	$ ./howl stop

## Connecting OWL Devices
Howl can deploy compiled patches and run them on OWL Devices. Make sure your devices is powered and connected to your host computer via USB. If Howl is not running yet, start it and after it is running execute following command:
	
	$ ./howl listdevices

If your OWL device is connected via USB and recognized by Howl, the output will give you system information on if it has been able to add your device properly.

## Getting Help

	$ ./howl help
	$ ./howl help <command-name>

Example of how to get help for the build command:

	$ ./howl help build

## Listing DSP Patches

Howl can access a local folder that contains the DSP patch repository. Within the Howl source folder you can find the patch repository located at ./patches relative to the root source folder. The repository is structured into subfolders that are odered by DSP patch language, e.g. cpp, faust, pd or gen.
If you want to install new patches simply copy them into the appropriate folders. Then run

	$ ./howl listpatches

to check if they were installed correctly. Only patches that have been installed properly in the Howl patch repository can be built and run by Howl.

## Listing and Running Howl Tests

All available Howl tests can be listed by running

	$ ./howl test list

If you want to run a test remember to pass the builtin test command the correct test repoistory location, e.g. for a test located in ./test/osx called mac-test-armgcc.sh run

	$ ./howl test osx/mac-test-armgcc

## Building C++ Patches

To build a C++ DSP patch named "Gain" and installed in the Howl repository as cpp/GainPatch.hpp run

	$ ./howl build --name=Gain --lang=cpp cpp/GainPatch.hpp

To build and run this patch run

	$ ./howl build --name=Gain --lang=cpp --run cpp/GainPatch.hpp


