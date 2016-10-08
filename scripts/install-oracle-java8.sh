#!/bin/bash

echo "Install oracle java 8"

apt-get update 
apt-get install -y software-properties-common 
apt-get clean && rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/*

add-apt-repository -y ppa:webupd8team/java

echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

apt-get install -y oracle-java8-installer