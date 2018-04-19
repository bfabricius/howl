#!/bin/bash -x

set -eu

# test to be run remotely with vagrant ssh -c

# check if arm-gcc is installed on howl properly
vagrant ssh -c /howl/tests/test-arm-gcc.sh
