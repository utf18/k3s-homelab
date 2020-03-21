#!/bin/bash

set -e

pushd /tmp/cluster-install

kubectl apply -f eck/elasticsearch.yml
kubectl apply -f eck/kibana.yml
kubectl apply -f eck/kibana-ingress.yml
kubectl apply -f eck/filebeat.yml
