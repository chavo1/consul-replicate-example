#!/usr/bin/env bash

CONSUL_REPLICATE=${CONSUL_REPLICATE}

sudo mkdir -p /vagrant/pkg

which consul-replicate || {
    # consul-replicate file exist.
    CHECKFILE="/vagrant/pkg/consul-replicate_${CONSUL_REPLICATE}_linux_amd64.zip"
    if [ ! -f "$CHECKFILE" ]; then
        pushd /vagrant/pkg
        wget https://releases.hashicorp.com/consul-replicate/${CONSUL_REPLICATE}/consul-replicate_${CONSUL_REPLICATE}_linux_amd64.zip
        popd
 
    fi
    
    pushd /usr/local/bin/
    unzip /vagrant/pkg/consul-replicate_${CONSUL_REPLICATE}_linux_amd64.zip
    sudo chmod +x consul-replicate
    popd
}