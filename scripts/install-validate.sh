#!/bin/bash

set -e

if test -z $HOWL_ROOT ; then
	echo >&2 "ERROR: No HOWL_ROOT envrironment set. Exiting." 
	exit 1
fi 

. "$HOWL_ROOT/scripts/helpers.sh"
. "$HOWL_ROOT/scripts/common.sh"

info_report "Validating Vagrant file"

if [ "$(vagrant_validate)" = "false" ] ; then
	error_report "Vagrantfile is not valid. This could lead to issues when starting howl. Try checking out a clean version of Vagrantfile."
else
	info_report "Vagrantfile is valid. You can now start howl."
fi

cd $HOWL_ROOT
exit 0
