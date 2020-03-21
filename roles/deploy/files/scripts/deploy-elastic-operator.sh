#!/bin/bash

set -e

pushd /tmp/cluster-install

kubectl apply -f eck/operator.yml

# make sure operator is up before we install crd based services
while [[ $(kubectl -n elastic-system get pods -l control-plane=elastic-operator -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; 
    do echo "waiting for pod" && sleep 1; 
done