#!/bin/sh

set -e

namespaces="monitoring logging metallb traefik nfs"
for namespace in $namespaces
do
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Namespace
metadata:
  name: $namespace
EOF
done