#!/bin/bash

YELLOW='\033[1;33m'
NC='\033[0m'

helm repo add kyverno https://kyverno.github.io/kyverno/
helm repo update
helm install kyverno kyverno/kyverno

echo -e "${YELLOW}=== Waiting for Kyverno pods to be ready ===${NC}"
kubectl wait --for=condition=ready pod -l app.kubernetes.io/name=kyverno --timeout=120s
