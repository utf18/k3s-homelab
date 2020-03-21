#!/bin/bash

set -e

pushd /tmp/cluster-install/charts-templated
for chart in *; do
  kubectl apply -k ${chart}/base
done
popd