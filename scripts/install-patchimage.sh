#!/bin/bash

set -e

if test -z $HOWL_ROOT ; then
	echo >&2 "ERROR: No HOWL_ROOT envrironment set. Exiting." 
	exit 1
fi 

. "$HOWL_ROOT/scripts/helpers.sh"
. "$HOWL_ROOT/scripts/common.sh"

info_report "Hiding mount.vboxsf to fix vagrant bug."
vagrant_ssh "rm -rf /home/vagrant/howl-installer ; mkdir /home/vagrant/howl-installer"
scp -P 2222 scripts/installer/hide-mountvboxsf.sh vagrant@127.0.0.1:./howl-installer/.
vagrant_ssh "./howl-installer/hide-mountvboxsf.sh"

exit $?
