# Paymesh - AKS GitOps Microservices Platform

## Overview
Paymesh is a production-like microservices platform deployed on Azure Kubernetes Service (AKS).
The project demonstrates infrastructure provisioning with Terraform, security enforcement via IaC scanning,
GitOps-based deployments, and end-to-end observability using Prometheus and Grafana.

## High-Level Architecture
- Cloud Provider: Microsoft Azure
- Kubernetes Platform: Azure Kubernetes Service (AKS)
- Infrastructure as Code: Terraform
- CI: GitHub Actions
- CD: ArgoCD (GitOps)
- Service Mesh: Istio
- Monitoring: Prometheus and Grafana
- Security Scanning: Checkov
- Package Management: Helm

## Repository Structure

- `apps/` – Application source code
  - `payment-api/` – Application API service
  - `payment-processor/` – Background processing service
  - `db-controller/` – Database interaction service
- `gitops/` – ArgoCD applications and manifests
- `terraform/` – AKS infrastructure provisioning
- `.github/workflows/` – CI pipelines (Checkov scanning)
- `istio-payments-namespace.yaml` – Istio namespace configuration
- `setup.sh` – One-command environment bootstrap
- `README.md` – Project documentation

## Application Overview
Paymesh consists of three Python microservices, each with a single responsibility.

payment-api
- Entry point for incoming payment requests
- Stateless HTTP API
- Exposes a Kubernetes Service
- No business logic

payment-processor
- Background worker
- Executes payment processing logic
- Decoupled from request handling

db-controller
- Centralized database interaction layer
- Isolates persistence logic from other services

Common characteristics:
- Containerized using Docker
- Independently deployable
- Managed declaratively using Kubernetes manifests

## Infrastructure Provisioning (Terraform)
Infrastructure is provisioned using Terraform.

Resources provisioned:
- Azure Resource Group
- Azure Kubernetes Service (AKS)
- Supporting Azure resources

Security practices:
- No secrets committed to Git
- Terraform state files excluded
- RBAC enforced via Azure and Kubernetes
- Declarative infrastructure

## IaC Security Scanning (Checkov)
Terraform and Kubernetes manifests are scanned using Checkov.

Integration:
- Implemented via GitHub Actions
- Runs on pull requests and pushes to main
- Produces SARIF output
- Results published to GitHub Security Code Scanning

## Deployment Model (GitOps)
Application deployment follows a GitOps model using ArgoCD.

- Kubernetes manifests stored in gitops/
- ArgoCD continuously reconciles desired state
- No manual deployments in production
- Git is the single source of truth

## GitHub Actions (CI & Platform Automation)

- GitHub Actions is used for continuous integration and platform automation
- Terraform and Kubernetes manifests are scanned using Checkov
- CI pipelines run on pull requests and pushes to the main branch
- A dedicated workflow executes the setup.sh script
- The workflow provisions AKS infrastructure and installs platform components
- GitOps applications are applied automatically via ArgoCD

## Monitoring and Observability
Monitoring is implemented using Prometheus and Grafana, installed via Helm.

Metrics available:
- CPU and memory usage
- Pod and node health
- Request latency and error rates
- Cluster-level performance

Reporting:
- Grafana dashboards support daily performance analysis

## Helm Charts Usage
Helm is used to manage shared platform components, not application workloads.

Helm-managed components:
- kube-prometheus-stack (Prometheus and Grafana)
- Strimzi Kafka Operator
- Istio components

Benefits:
- Versioned installations
- Simplified upgrades and rollbacks
- Clear separation between platform and application code

## Custom Resource Definitions (CRDs)

This project uses Custom Resource Definitions (CRDs) strictly at the platform layer.
CRDs are introduced by Kubernetes operators and platform components installed during
cluster bootstrap.

## Database Custom Resource Definition (CRD)

This project defines a **custom database CRD** to manage database configuration declaratively at the
platform level.

The CRD is designed to abstract database provisioning and configuration away from application code
and enable GitOps-based management.


---

### Platform-Level CRDs

CRDs extend the Kubernetes API to support advanced platform capabilities such as
monitoring, messaging, and service mesh functionality. These CRDs are installed
once per cluster and are independent of application lifecycle.

---


CRDs:
- Prometheus
- Alertmanager
- ServiceMonitor
- PodMonitor
- PrometheusRule

Purpose:
- Declarative Prometheus and Alertmanager configuration
- Metrics scraping and aggregation
- Alerting and recording rules

Scope:
- Cluster-wide
- Installed once per cluster
- Platform-managed

---

### Messaging / Streaming CRDs (Strimzi Kafka Operator)

Installed as part of the Strimzi Kafka Operator.


CRDs:
- Kafka
- KafkaNodePool
- KafkaTopic
- KafkaUser
- KafkaConnector

Purpose:
- Kafka cluster provisioning and lifecycle management
- Scaling, upgrades, and TLS configuration
- Declarative messaging infrastructure

Scope:
- Cluster-wide
- Platform-managed

---

### Service Mesh CRDs (Istio)

Installed as part of the Istio service mesh.



CRDs:
- VirtualService
- DestinationRule
- Gateway
- PeerAuthentication
- AuthorizationPolicy

Purpose:
- Traffic routing and load balancing
- mTLS enforcement
- Fine-grained service-to-service authorization

Scope:
- Cluster-wide
- Networking and security layer


## Local Environment Setup
Local environment setup is standardized using a single script.

Run:

-chmod +x setup.sh

-./setup.sh

The script:
- Provisions infrastructure using Terraform
- Configures AKS access
- Creates namespaces
- Installs ArgoCD, Istio, Prometheus, Grafana, and Kafka operator
- Applies GitOps applications

This is the only supported setup method.

## Access Information
ArgoCD:
kubectl port-forward svc/argocd-server -n argocd 8081:443

Grafana:
kubectl port-forward svc/monitoring-grafana -n monitoring 3000:80

Prometheus:
kubectl port-forward svc/monitoring-kube-prometheus-prometheus -n monitoring 9090:9090

## CI/CD Workflow

- **Infrastructure:** Terraform
- **CI:** GitHub Actions (security and validation)
- **CD:** ArgoCD (continuous deployment)
- **Runtime:** Istio (traffic and security)
- **Monitoring:** Prometheus and Grafana


## Design Decisions
- GitOps over imperative deployments
- Security enforced at CI level
- Platform handles networking, security, and observability
- Application code remains simple
- Single-command environment bootstrap

## Future Enhancements
- Kubernetes Network Policies
- Azure Key Vault integration
- Progressive delivery strategies
- Container image scanning
- Distributed tracing
- Alerting with Alertmanager
- Multi-environment promotion
- Horizontal Pod Autoscaling

## Summary
Paymesh demonstrates a secure, automated, and production-aligned AKS platform using modern DevSecOps practices.





