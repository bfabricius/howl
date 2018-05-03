#!/usr/bin/bash

set -e

. /howl/scripts/exports.sh

if [[ $# -ne 3 ]]; then
	echo "Script accepts exactly 2 arguments."
	echo "Usage: buildpd <patch repository path> <patch name>"
	exit 1
fi

# echo $1
# echo $2

if [[ -f $1 ]]; then
	echo "PD patch ${1} found."
	cp $1 /home/vagrant/source/OwlProgram/PatchSource/.
	echo "PD patch ${1} copied to OwlProgram patch source folder."
	cd /home/vagrant/source/OwlProgram && \
	make clean
	if [[ $3 -eq 1 ]]; then
		echo "Attempting to deploy and run PD patch ${2} on OWL device after building it"
		make HEAVY="${2}" run
	else
		make HEAVY="${2}"
	fi
	cd /home/vagrant
	echo "Successfully compiled PD patch ${2}"
fi

# echo $?
exit $?