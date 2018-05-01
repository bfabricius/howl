#!/usr/bin/bash

set -eu

# test to be run remotely with vagrant ssh -c
echo '=================================='
echo 'Howl Test: Check for arm gcc compiler'
echo '=================================='

# check if arm-gcc is installed on howl properly
source /howl/scripts/exports.sh

which arm-none-eabi-gcc \
	&& echo '==================================' \
	&& arm-none-eabi-gcc -v

if [[ $? -ne 0 ]]; then
	echo '[FAILED] Could not find working arm compiler.'
	exit 1
fi
echo '=================================='
echo '[OK] Found working arm compiler.'
echo '=================================='
exit 0