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

echo "10.48.1.52 area51.boi.a10networks.com area51" | sudo tee -a /etc/hosts
echo "10.48.1.51 mirror.boi.a10networks.com mirror" | sudo tee -a /etc/hosts

# Double check that when the node is made ready it is able
# to resolve names against DNS.
host git.openstack.org

LSBDISTID=$(lsb_release -is)
LSBDISTCODENAME=$(lsb_release -cs)
if [ "$LSBDISTID" == "Ubuntu" ] ; then
sudo dd of=/etc/apt/sources.list <<EOF
deb http://mirror.boi.a10networks.com/ubuntu $LSBDISTCODENAME main restricted universe multiverse
deb http://mirror.boi.a10networks.com/ubuntu $LSBDISTCODENAME-security main restricted universe multiverse
deb http://mirror.boi.a10networks.com/ubuntu $LSBDISTCODENAME-updates main restricted universe multiverse
deb http://mirror.boi.a10networks.com/ubuntu $LSBDISTCODENAME-backports main restricted universe multiverse
EOF
fi
sudo apt-get -y update

# Install java 8 jdk as it's needed by jenkins
sudo apt-get -y install openjdk-8-jdk
