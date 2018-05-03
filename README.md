# Howl
Hypervised OWL build environment for audio DSP patch compilation and deployment

Currently [Released](https://github.com/bfabricius/howl/releases) Version: v0.1.5-experimental

![Howl Logo](https://github.com/bfabricius/howl/blob/master/images/howl.png)

**NOTE: This documentation is not yet complete until the 1.0.0-stable release and is work in progress. Until then functionality documented here might not be implemented yet or might not be working as expected allthough we do try to keep the latest development master branch working if possible.**

Howl is a virtual build environment for compiling and deploying audio [](https://)DSP patches for [](https://)Rebel Technologies' programmable Open Ware Laboratory devices like the OWL Modular. The Howl cross compile environment and build tools are self contained in a virtual machine that is run using a Vagrant provider, in this case Virtualbox.

Howl is developed with love by [Happy Thougths Audio](https://www.htaudio.de). Thanks go out to the [guys](https://https://www.rebeltech.org/) from Rebel Technology and the community there for their support in developing Howl.

## Features
* Installer to automate installation of virtual machine
* Howl CLI tool to run compilation and deployment of polyglot audio DSP patches

## Supported DSP patch languages
OWL patches can be written in c++, Pure Data (Pd), faust or max/msp gen. Howl currently supports
* C++
* Pd

## Supported Platforms
At this point Howl has only been developed and tested for Mac OSX with Virtualbox. Porting this to other platforms and Vagrant providers should be striaght forward so please do fork this repository and create some pull requests for further platform support. We appreciate your support.

## Dependencies
Prior to installing and running Howl you will have to make sure you have following dependencies installed:
* [Virtualbox](https://www.virtualbox.org/)
* [Vagrant](https://www.vagrantup.com/)

## Quick Start
Checkout this repository, cd to the root folder of this project and run

	$ ./installer.sh

After the installer has ensured you are running the correct dependencies and has installed the virtual machine you can proceed to boot Howl:
	
	$ ./howl start

If you encounter an error message claiming shared folders cannot be mounted automatically (this is a bug in vagrant atm) please run

	$ ./installer -p

now to fix the issues. The installer will attempt connet to the virtual machine and run a script on it to fix the issue. During this process the installer might ask you to add a new SSH host key to your system, type "yes" and hit enter. Then the installer will request a password for user "vagrant". Type "vagrant" and hit enter. The installer will then login to the VM and fix the issue. After the installer is finished restart howl by stopping and the starting again.

Once howl has booted you will receive a confirmation. After this confirmation why not run some tests to see if everything is working as expected

	$ ./howl test osx/mac-test-armgcc
	$ ./howl test osx/mac-test-firmwaresender

Should your tests be successfull you can go ahead and try compiling and running your first patch. With your OWL device connected, run

	$ ./howl build --name=Gain --lang=cpp --run cpp/GainPatch.hpp

Once compilation is done you should get a confirmation. Power down Howl by running

	$ ./howl stop

## Connecting OWL Devices
Howl can deploy compiled patches and run them on OWL Devices. Make sure your device is powered and connected to your host computer via USB. If Howl is not running yet, start it and after it is running execute following command:
	
	$ ./howl listdevices

Example Output

	$ ./howl listdevices
	[INFO] Listing USB devices detected by Howl virtual machine
	Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
	Bus 002 Device 002: ID 1209:dada InterBiometrics Rebel Technology OWL
	Bus 002 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub

If your OWL device is connected via USB and recognized by Howl, the output will give you system information on if it has been able to add your device properly.

## Getting Help

	$ ./howl help
	$ ./howl help <command-name>

Example of how to get help for the build command:

	$ ./howl help build

## Getting New Patches
OWL DSP Patches are compiled for the [Open Ware Laboratory API](https://github.com/pingdynasty/owl) and can be written in different languages. Aside from designing your own patches you can select from the [many available patches maintained online](https://www.rebeltech.org/patch-library/patches/latest).

## Installing Patches
New patches must be installed to the Howl patch repository folder. You can do this by copying the files to a specific path relative to the project root folder depending on the language it is written in:
* C++ patches are copied to ./patches/cpp/
* pd patches are copied to ./patches/pd/
* Faust patches are copied to ./patches/faust/
* Max/MSP Gen patches are copied to ./patches/gen/

## Listing DSP Patches
Howl can list all patches in its repository by executing

	$ ./howl listpatches

Only patches that have been installed properly in the Howl patch repository can be built and run by Howl.

## Listing and Running Howl Tests
All available Howl tests can be listed by running

	$ ./howl test list

If you want to run a test remember to pass the builtin test command the correct test repoistory location, e.g. for a test located in ./tests/osx called mac-test-armgcc.sh run

	$ ./howl test osx/mac-test-armgcc

## Configuring Howl
Howl has configuration settings that are exported to the environment of the virtual machine. You can list the current configuration with

	$ ./howl readconfig

You can configure any of the variables by calling

	$ ./howl configure <variable name> <value>

Note: Most of the preconfigured settings should work fine for your, if you do change anything beware that a misconfiguration can cause howl commands to fail when being used. ./howl configure will create a backup file of your configuration with the extension .bak in the directory ./scripts/howl for safety.

## Building C++ Patches
To build a C++ DSP patch that is named "Gain" and is installed in the Howl repository as cpp/GainPatch.hpp run the following command

	$ ./howl build --name=Gain --lang=cpp cpp/GainPatch.hpp

To build and run this patch on your OWL device run

	$ ./howl build --name=Gain --lang=cpp --run cpp/GainPatch.hpp

## Building Pure Data Patches
Make sure you have your computer hooked up to the internet. To compile Pd patches an online compiler called Heavy by Enzien Audio is used. You will have to make sure you create an account with Enzien Audio and create a project called "owl". See image below for reference:

![Enzien Audio Project](https://github.com/bfabricius/howl/blob/master/images/EnzienProject.png)

Once you have set up your project you will need to confiugure a user token to access the compiler. Your tokens are saved in your user settings. If you do not have a token yet, click "add token" and label the token "owl-upload". After that, copy your token into the clipboard. See the image below for an example of a token.

![Enzien Audio Token](https://github.com/bfabricius/howl/blob/master/images/EnzienToken.png)

To configure your token for Howl, now run

	$ ./howl configure HEAVYTOKEN <paste your token here>

Configure will list the configuration after making changes so you can double check your settings. After that you are ready to compile Pd patches in Howl.

To build a Pd DSP patch that is named "HeavyOwl" and is installed in the Howl repository as pd/HeavyOwl.pd run the following command

	$ ./howl build --name=HeavyOwl --lang=pd cpp/HeavyOwl.pd

To build and run this patch on your OWL device run

	$ ./howl build --name=HeavyOwl --lang=pd --run cpp/HeavyOwl.pd

## Support Us
If you are enjoying this software please support us by
* starring this repository
* spreading the word about Howl in the community and writing about it (let us know! :) )
* contributing to Howl -> add something cool and create a pull request
* following Happy Thoughts Audio
  * [Our Website](https://www.htaudio.de)
  * [Instgram/_htaudio](https://www.instagram.com/_htaudio/)
  * [facebook/happythoughtsaudio](https://www.facebook.com/happythoughtsaudio)
  * [twitter/_htaudio](https://twitter.com/_htaudio)

Thanks a lot!