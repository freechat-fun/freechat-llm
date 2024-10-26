#!/usr/bin/env bash

source $(dirname ${BASH_SOURCE[0]})/setenv.sh

pod=$(kubectl get pods -o name --kubeconfig ${KUBE_CONFIG} --namespace ${NAMESPACE} \
  | awk -F'/' '{print $2}'| grep "${PROJECT_NAME}" | head -1)

test -n "${pod}" || die "ERROR: Failed to find ollama pod!"

kubectl exec --kubeconfig ${KUBE_CONFIG} --namespace ${NAMESPACE} \
  -it ${pod} -c ollama -- /bin/bash