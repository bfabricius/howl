#!/bin/bash

if test -z $HOWL_ROOT ; then
	echo >&2 "ERROR: No HOWL_ROOT envrironment set. Exiting." 
	exit 1
fi

. "$HOWL_ROOT/scripts/common.sh"

# bash colors
NC='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'

# info and usage


howl_version () {
	if test -f howl-version.txt ; then
		echo $(cat howl-version.txt)
	else
		echo "0.0.0"
	fi
}

information() {
	echo "howl $(howl_version) - Virtual build environment for compiling and running OWL polyglot DSP patches."
	cat <<EOF

This is the official installer script for automating the installation of howl.
Please report any problems by creating a github issue at www.github/howl
or sending an email to <support@htaudio.de>.

EOF
}

# reporting

ok_report() {
	echo -e "${GREEN}[OK] ${NC}$1"
}

error_report () {
	echo -e "${RED}[ERROR] ${NC}$1"
}

info_report () {
	echo -e "${YELLOW}[INFO] ${NC}$1"
}

install_phase() {
	echo "------------------------------------------"
	echo "$1"
	echo "------------------------------------------"
}

vagrant_up() {
	vagrant up
	if test $? -eq 0 ; then
		echo "true"
	else
		echo "false"
	fi
}

vagrant_halt() {
	vagrant halt
	if test $? -eq 0 ; then
		echo "true"
	else
		echo "false"
	fi
}

vagrant_reload() {
	vagrant reload
	if test $? -eq 0 ; then
		echo "true"
	else
		echo "false"
	fi
}

vagrant_vm_status() {
	local running=$(vagrant status | egrep $ARCH_HOWL_BOX_REGEX | grep running)
	if test "$running" = "" ; then
		echo "Howl virtual machine not running"
	else
		echo "Howl virtual machine status:"
		echo "${running}"
	fi
}

vagrant_vm_running() {
	local running=$(vagrant status | egrep $ARCH_HOWL_BOX_REGEX | grep running)
	if test "$running" = "" ; then
		echo "false"
	else
		echo "true"
	fi
}

vagrant_ssh() {
	vagrant ssh -c "${1}"
}

vagrant_validate() {
	vagrant validate
	if test $? -eq 0 ; then
		echo "true"
	else
		echo "false"
	fi 
}
