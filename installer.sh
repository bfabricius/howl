#!/bin/bash

export HOWL_ROOT=$PWD

# test helpers

. "$HOWL_ROOT/scripts/common.sh"
. "$HOWL_ROOT/scripts/helpers.sh"

# test for vbguest plugin for vagrant
is_virtualbox_installed() {
	local ver=$(VBoxManage --version | cut -d '.' -f 1)
	if [[ $ver -ge $VBOX_VERSION ]] ; then
		echo "true"
	else
		echo "false"
	fi
}

# script starts here

information

# test if vagrant vbguest plugin is installed
install_phase "HYPERVISOR"
echo "Testing if virtualbox is installed."
if test $(is_virtualbox_installed) = "false"; then
	error_report "Virtualbox is not installed or the version is not supported."
	cat <<EOF
Please install virtualbox ${VBOX_VERSION}.x and then re-run the installer.
EOF
	echo "Exiting."
	exit 1
else
	ok_report "Virtualbox is installed, version: $(VBoxManage --version)"
fi

install_phase "Vagrant Box"
$HOWL_ROOT/scripts/install-arch-howl-box.sh $HOWL_ROOT

install_phase "Vagrant Validate"
$HOWL_ROOT/scripts/install-validate.sh $HOWL_ROOT

exit $?
