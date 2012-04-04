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
echo $INFO_FILE
grep localrc $INFO_FILE | awk -F"|" '{ if (length($2)) { print $2; } }' > localrc
