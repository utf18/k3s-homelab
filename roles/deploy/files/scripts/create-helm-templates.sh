#!/bin/bash

set -e

# create neccesary folder in charts-templated
# cp kustomization.yml's to each folder
# create helm templates for later use with kustomize in a subfolder for each file
pushd /tmp/cluster-install/charts
for chart in *; do
  # override namespace for grafana,prometheus etc..
  case $chart in
  grafana)
    namespace=monitoring
    ;;
  prometheus)
    namespace=monitoring
    ;;
  # default namespace name is chart/folder name
  *)
    namespace=${chart}
    ;;
  esac
  
  # create folder structure
  mkdir -p ../charts-templated/${chart}/base

  # copy base kustomization yaml
  cp  ${chart}/kustomization.yml ../charts-templated/${chart}/base/kustomization.yml

  # helm template the charts and write them to the created folder structure in charts-templated
  helm template ${chart} --namespace ${namespace} ${chart}/ -f ${chart}/values.yaml > ../charts-templated/${chart}/base/${chart}-templated.yml
done