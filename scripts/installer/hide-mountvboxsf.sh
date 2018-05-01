#!/usr/bin/bash

set -e

if [[ -f /usr/bin/mount.vboxsf ]]; then
	echo "Hiding /usr/bin/mount.vboxsf"
	/usr/bin/sudo /usr/bin/mv /usr/bin/mount.vboxsf /usr/bin/mount.vboxsf.hidden
else
	echo "Could not locate /usr/bin/mount.vboxsf"
fi

exit $?
