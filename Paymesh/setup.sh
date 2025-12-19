#!/usr/bin/env bash
set -e

echo "======================================"
echo " PAYMESH – AKS GITOPS SETUP"
echo "======================================"

# -------------------------
# Prerequisites
# -------------------------
for cmd in az kubectl terraform helm curl; do
  command -v $cmd >/dev/null || { echo "❌ $cmd not found"; exit 1; }
done

# -------------------------
# Terraform (Infra)
# -------------------------
echo ">>> Terraform apply"
cd terraform
terraform init
terraform apply -auto-approve
cd ..

# -------------------------
# AKS kubeconfig
# -------------------------
echo ">>> Fetching AKS credentials"
az aks get-credentials \
  --resource-group paymesh-rg \
  --name paymesh-aks \
  --overwrite-existing

# -------------------------
# Namespaces
# -------------------------
echo ">>> Creating namespaces"
for ns in argocd payments kafka monitoring istio-system; do
  kubectl create ns $ns --dry-run=client -o yaml | kubectl apply -f -
done

kubectl label ns payments istio-injection=enabled --overwrite

# -------------------------
# Argo CD
# -------------------------
echo ">>> Installing Argo CD"
if ! kubectl get deploy argocd-server -n argocd &>/dev/null; then
  kubectl apply -n argocd \
    -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
fi

kubectl rollout status deployment argocd-server -n argocd

# -------------------------
# Istio
# -------------------------
echo ">>> Installing Istio"
if ! kubectl get deploy istiod -n istio-system &>/dev/null; then
  if [ ! -d istio-1.28.1 ]; then
    curl -L https://istio.io/downloadIstio | ISTIO_VERSION=1.28.1 sh -
  fi
  export PATH=$PWD/istio-1.28.1/bin:$PATH
  istioctl install --set profile=demo -y
fi

# -------------------------
# Monitoring (Prometheus + Grafana)
# FIX: Helm manages CRDs
# -------------------------
echo ">>> Installing kube-prometheus-stack"
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts || true
helm repo update

helm upgrade --install monitoring prometheus-community/kube-prometheus-stack \
  -n monitoring \
  --set crds.enabled=true

# -------------------------
# Strimzi Kafka Operator
# -------------------------
echo ">>> Installing Strimzi Kafka Operator"
helm repo add strimzi https://strimzi.io/charts/ || true
helm repo update

if ! helm status strimzi-kafka-operator -n kafka &>/dev/null; then
  helm install strimzi-kafka-operator strimzi/strimzi-kafka-operator -n kafka
else
  echo "✔ Strimzi already installed"
fi

# -------------------------
# GitOps Applications
# -------------------------
echo ">>> Applying Argo CD Applications"
kubectl apply -n argocd -f gitops/applications/

# -------------------------
# Wait
# -------------------------
echo ">>> Waiting for reconciliation"
sleep 30

# -------------------------
# Output info
# -------------------------
echo "======================================"
echo " SETUP COMPLETE"
echo "======================================"
echo

echo "🔐 Argo CD:"
echo "kubectl port-forward --address 0.0.0.0 svc/argocd-server -n argocd 8081:443"
echo "URL: https://localhost:8081"
echo -n "Password: "
kubectl get secret argocd-initial-admin-secret -n argocd \
  -o jsonpath="{.data.password}" | base64 -d
echo
echo

echo "📊 Grafana:"
echo "kubectl port-forward svc/monitoring-grafana -n monitoring 3000:80"
echo "URL: http://localhost:3000"
echo -n "Password: "
kubectl get secret monitoring-grafana -n monitoring \
  -o jsonpath="{.data.admin-password}" | base64 -d
echo
echo

echo "📈 Prometheus:"
echo "kubectl port-forward svc/monitoring-kube-prometheus-prometheus -n monitoring 9090:9090"
echo "URL: http://localhost:9090"
echo

echo "🌐 Istio Ingress:"
echo "kubectl get svc istio-ingressgateway -n istio-system"
echo "Use EXTERNAL-IP on port 80"
echo
