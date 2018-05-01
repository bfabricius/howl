#!/usr/bin/bash

# set -eu

# test to be run remotely with vagrant ssh -c
echo '=================================='
echo 'Howl Test: Check for firmwaresender tool'
echo '=================================='

# check if arm-gcc is installed on howl properly
source /howl/scripts/exports.sh

which firmwaresender \
	&& echo '==================================' \

firmwaresender -h ; firmwaresender -l

echo '=================================='
echo 'If you see output from firmwaresender it is up and running.'
echo '=================================='
exit 0
