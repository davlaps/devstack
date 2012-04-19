#!/bin/bash

# Simple script to setup localrc on test node.
# Execute this script from the root directory. For example:
#
#	$ samples/scenarios/setup.sh
#
# Assumes your hostname has been set to one of gto, mustang, or charger.
#
# Modify the SCENARIO variable below to use a different scenario.

HOSTNAME=`hostname`
SCENARIO=multinode-ovs
INFO_FILE=samples/scenarios/$SCENARIO/$HOSTNAME-info
STACK_ROOT=/opt/stack

echo $INFO_FILE
for l in `grep git $INFO_FILE`
do
	MOD=`echo $l | awk -F"|" '{ print $2; }'`
	VER=`echo $l | awk -F"|" '{ print substr($3, 8, 7); }'`

	if [ $MOD != "git-core" ]; then
		pushd $STACK_ROOT/$MOD
		git checkout $VER
		popd
	fi
done
