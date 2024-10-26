#!/usr/bin/env bash

source $(dirname ${BASH_SOURCE[0]})/setenv.sh

pod=$(kubectl get pods -o name --kubeconfig ${KUBE_CONFIG} --namespace ${NAMESPACE} \
  | awk -F'/' '{print $2}'| grep "${PROJECT_NAME}" | head -1)

test -n "${pod}" || die "ERROR: Failed to find ollama pod!"

kubectl logs --kubeconfig ${KUBE_CONFIG} --namespace ${NAMESPACE} ${pod}