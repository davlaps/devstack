#!/usr/bin/python

# Copyright (C) 2009-2012 Nicira Networks, Inc. All Rights Reserved.
#
# This software is provided only under the terms and conditions of a written
# license agreement with Nicira. If no such agreement applies to you, you are
# not authorized to use this software. Contact Nicira to obtain an appropriate
# license: www.nicira.com.
#
# Author(s): Dave Lapsley

import os
import subprocess
import urllib

stack_root = '/opt/stack'

try:
    os.mkdir(stack_root)
except OSError as e:
    print 'Directory: %s' % e

with open('repos.dat') as input:
    for l in input.readlines():
        l = l.strip()
        repo, commit = l.split()
        host, path = urllib.splithost(repo)
        repo_dir = (stack_root + '/'
                    + os.path.splitext(os.path.basename(path))[0])
        subprocess.call(['git', 'clone', repo, repo_dir])
        subprocess.call('cd %s && git checkout %s' % (repo_dir, commit),
                        shell=True)
