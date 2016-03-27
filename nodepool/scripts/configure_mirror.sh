#!/bin/bash -xe

# Copyright (C) 2014 Hewlett-Packard Development Company, L.P.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
# implied.
#
# See the License for the specific language governing permissions and
# limitations under the License.

source /etc/nodepool/provider

NODEPOOL_PYPI_MIRROR=${NODEPOOL_PYPI_MIRROR:-http://mirror.boi.a10networks.com:81/simple/}

sudo dd of=/etc/pip.conf <<EOF
[global]
index-url = $NODEPOOL_PYPI_MIRROR

[install]
trusted-host = mirror.boi.a10networks.com
EOF

cat >/home/jenkins/.pydistutils.cfg <<EOF
[easy_install]
index_url = $NODEPOOL_PYPI_MIRROR
allow_hosts = *.openstack.org
EOF

# Double check that when the node is made ready it is able
# to resolve names against DNS.
host git.openstack.org

LSBDISTID=$(lsb_release -is)
LSBDISTCODENAME=$(lsb_release -cs)
if [ "$LSBDISTID" == "Ubuntu" ] ; then
sudo dd of=/etc/apt/sources.list <<EOF
deb http://mirror.boi.a10networks.com/ubuntu trusty main restricted universe multiverse
deb http://mirror.boi.a10networks.com/ubuntu trusty-security main restricted universe multiverse
deb http://mirror.boi.a10networks.com/ubuntu trusty-updates main restricted universe multiverse
EOF
fi
