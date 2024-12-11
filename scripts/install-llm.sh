#!/usr/bin/env bash

source $(dirname ${BASH_SOURCE[0]})/setenv.sh

check_helm

helm repo add ollama-helm https://otwld.github.io/ollama-helm/
helm repo update
helm install --kubeconfig ${KUBE_CONFIG} --create-namespace -f ${values_yaml} \
  --namespace ${NAMESPACE} \
  ${ARGS[*]} \
  ${PROJECT_NAME} ollama-helm/ollama

