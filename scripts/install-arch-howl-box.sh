#!/bin/bash

set -e

if test -z $HOWL_ROOT ; then
	echo >&2 "ERROR: No HOWL_ROOT envrironment set. Exiting." 
	exit 1
fi 

. "$HOWL_ROOT/scripts/helpers.sh"
. "$HOWL_ROOT/scripts/common.sh"

info_report "Running Vagrant Box installer for Howl from $HOWL_ROOT"

is_arch_howl_installed() {
	local inst=$(vagrant box list | grep arch-howl)
	if [[ -n $inst ]]; then
		echo "true"
	else
		echo "false"
	fi
}

if test $(is_arch_howl_installed) = "false" ; then
	info_report "arch-howl base box not found. Attempting to add it now."
	vagrant box add $ARCH_HOWL_BASE_BOX && ok_report "Added arch-howl base box."
else
	info_report "Found arch-howl base box. Version $(vagrant box list | grep arch-howl)."
fi


cd $HOWL_ROOT
exit 0
