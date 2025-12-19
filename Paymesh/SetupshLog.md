
>>> Provisioning Azure infrastructure
Initializing the backend...
Initializing provider plugins...
- Reusing previous version of hashicorp/azurerm from the dependency lock file
- Installing hashicorp/azurerm v4.57.0...
- Installed hashicorp/azurerm v4.57.0 (signed by HashiCorp)

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # azurerm_container_registry.acr will be created
  + resource "azurerm_container_registry" "acr" {
      + admin_enabled                 = true
      + admin_password                = (sensitive value)
      + admin_username                = (known after apply)
      + data_endpoint_host_names      = (known after apply)
      + encryption                    = (known after apply)
      + export_policy_enabled         = true
      + id                            = (known after apply)
      + location                      = "centralindia"
      + login_server                  = (known after apply)
      + name                          = "paymeshacr12345"
      + network_rule_bypass_option    = "AzureServices"
      + network_rule_set              = (known after apply)
      + public_network_access_enabled = true
      + resource_group_name           = "paymesh-rg"
      + sku                           = "Basic"
      + trust_policy_enabled          = false
      + zone_redundancy_enabled       = false
    }

  # azurerm_kubernetes_cluster.aks will be created
  + resource "azurerm_kubernetes_cluster" "aks" {
      + ai_toolchain_operator_enabled       = false
      + current_kubernetes_version          = (known after apply)
      + dns_prefix                          = "paymesh-aks"
      + fqdn                                = (known after apply)
      + http_application_routing_zone_name  = (known after apply)
      + id                                  = (known after apply)
      + kube_admin_config                   = (sensitive value)
      + kube_admin_config_raw               = (sensitive value)
      + kube_config                         = (sensitive value)
      + kube_config_raw                     = (sensitive value)
      + kubernetes_version                  = (known after apply)
      + location                            = "centralindia"
      + name                                = "paymesh-aks"
      + node_os_upgrade_channel             = "NodeImage"
      + node_resource_group                 = (known after apply)
      + node_resource_group_id              = (known after apply)
      + oidc_issuer_url                     = (known after apply)
      + portal_fqdn                         = (known after apply)
      + private_cluster_enabled             = false
      + private_cluster_public_fqdn_enabled = false
      + private_dns_zone_id                 = (known after apply)
      + private_fqdn                        = (known after apply)
      + resource_group_name                 = "paymesh-rg"
      + role_based_access_control_enabled   = true
      + run_command_enabled                 = true
      + sku_tier                            = "Free"
      + support_plan                        = "KubernetesOfficial"
      + workload_identity_enabled           = false

      + auto_scaler_profile (known after apply)

      + bootstrap_profile (known after apply)

      + default_node_pool {
          + kubelet_disk_type    = (known after apply)
          + max_pods             = (known after apply)
          + name                 = "agentpool"
          + node_count           = 1
          + node_labels          = (known after apply)
          + orchestrator_version = (known after apply)
          + os_disk_size_gb      = (known after apply)
          + os_disk_type         = "Managed"
          + os_sku               = (known after apply)
          + scale_down_mode      = "Delete"
          + type                 = "VirtualMachineScaleSets"
          + ultra_ssd_enabled    = false
          + vm_size              = "Standard_B2s_v2"
          + workload_runtime     = (known after apply)
        }

      + identity {
          + principal_id = (known after apply)
          + tenant_id    = (known after apply)
          + type         = "SystemAssigned"
        }

      + kubelet_identity (known after apply)

      + network_profile (known after apply)

      + node_provisioning_profile (known after apply)

      + windows_profile (known after apply)
    }

  # azurerm_resource_group.rg will be created
  + resource "azurerm_resource_group" "rg" {
      + id       = (known after apply)
      + location = "centralindia"
      + name     = "paymesh-rg"
    }

  # azurerm_role_assignment.acr_pull will be created
  + resource "azurerm_role_assignment" "acr_pull" {
      + condition_version                = (known after apply)
      + id                               = (known after apply)
      + name                             = (known after apply)
      + principal_id                     = (known after apply)
      + principal_type                   = (known after apply)
      + role_definition_id               = (known after apply)
      + role_definition_name             = "AcrPull"
      + scope                            = (known after apply)
      + skip_service_principal_aad_check = (known after apply)
    }

Plan: 4 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + acr_login_server = (known after apply)
  + aks_name         = "paymesh-aks"
  + kubeconfig       = (sensitive value)
azurerm_resource_group.rg: Creating...
azurerm_resource_group.rg: Still creating... [00m10s elapsed]
azurerm_resource_group.rg: Still creating... [00m20s elapsed]
azurerm_resource_group.rg: Creation complete after 28s [id=/subscriptions/55cfe9f7-868c-4af6-88fd-fe7e13c4eb63/resourceGroups/paymesh-rg]
azurerm_container_registry.acr: Creating...
azurerm_kubernetes_cluster.aks: Creating...
azurerm_container_registry.acr: Still creating... [00m10s elapsed]
azurerm_kubernetes_cluster.aks: Still creating... [00m10s elapsed]
azurerm_container_registry.acr: Still creating... [00m20s elapsed]
azurerm_kubernetes_cluster.aks: Still creating... [00m20s elapsed]
azurerm_container_registry.acr: Creation complete after 25s [id=/subscriptions/55cfe9f7-868c-4af6-88fd-fe7e13c4eb63/resourceGroups/paymesh-rg/providers/Microsoft.ContainerRegistry/registries/paymeshacr12345]
azurerm_kubernetes_cluster.aks: Still creating... [00m30s elapsed]
azurerm_kubernetes_cluster.aks: Still creating... [00m40s elapsed]
azurerm_kubernetes_cluster.aks: Still creating... [00m50s elapsed]
azurerm_kubernetes_cluster.aks: Still creating... [01m00s elapsed]
azurerm_kubernetes_cluster.aks: Still creating... [01m10s elapsed]
azurerm_kubernetes_cluster.aks: Still creating... [01m20s elapsed]
azurerm_kubernetes_cluster.aks: Still creating... [01m30s elapsed]
azurerm_kubernetes_cluster.aks: Still creating... [01m40s elapsed]
azurerm_kubernetes_cluster.aks: Still creating... [01m50s elapsed]
azurerm_kubernetes_cluster.aks: Still creating... [02m00s elapsed]
azurerm_kubernetes_cluster.aks: Still creating... [02m10s elapsed]
azurerm_kubernetes_cluster.aks: Still creating... [02m20s elapsed]
azurerm_kubernetes_cluster.aks: Still creating... [02m30s elapsed]
azurerm_kubernetes_cluster.aks: Still creating... [02m40s elapsed]
azurerm_kubernetes_cluster.aks: Still creating... [02m50s elapsed]
azurerm_kubernetes_cluster.aks: Still creating... [03m00s elapsed]
azurerm_kubernetes_cluster.aks: Still creating... [03m10s elapsed]
azurerm_kubernetes_cluster.aks: Still creating... [03m20s elapsed]
azurerm_kubernetes_cluster.aks: Still creating... [03m30s elapsed]
azurerm_kubernetes_cluster.aks: Creation complete after 3m31s [id=/subscriptions/55cfe9f7-868c-4af6-88fd-fe7e13c4eb63/resourceGroups/paymesh-rg/providers/Microsoft.ContainerService/managedClusters/paymesh-aks]
azurerm_role_assignment.acr_pull: Creating...
azurerm_role_assignment.acr_pull: Still creating... [00m10s elapsed]
azurerm_role_assignment.acr_pull: Still creating... [00m20s elapsed]
azurerm_role_assignment.acr_pull: Creation complete after 28s [id=/subscriptions/55cfe9f7-868c-4af6-88fd-fe7e13c4eb63/resourceGroups/paymesh-rg/providers/Microsoft.ContainerRegistry/registries/paymeshacr12345/providers/Microsoft.Authorization/roleAssignments/c1d333a9-cdc8-d8c0-21f7-d00dab82f0ac]

Apply complete! Resources: 4 added, 0 changed, 0 destroyed.

Outputs:

acr_login_server = "paymeshacr12345.azurecr.io"
aks_name = "paymesh-aks"
kubeconfig = <sensitive>
>>> Fetching AKS credentials
Merged "paymesh-aks" as current context in /root/.kube/config
>>> Creating namespaces
namespace/argocd created
namespace/payments created
namespace/kafka created
namespace/monitoring created
namespace/istio-system created
namespace/payments labeled
>>> Installing Argo CD
customresourcedefinition.apiextensions.k8s.io/applications.argoproj.io created
customresourcedefinition.apiextensions.k8s.io/applicationsets.argoproj.io created
customresourcedefinition.apiextensions.k8s.io/appprojects.argoproj.io created
serviceaccount/argocd-application-controller created
serviceaccount/argocd-applicationset-controller created
serviceaccount/argocd-dex-server created
serviceaccount/argocd-notifications-controller created
serviceaccount/argocd-redis created
serviceaccount/argocd-repo-server created
serviceaccount/argocd-server created
role.rbac.authorization.k8s.io/argocd-application-controller created
role.rbac.authorization.k8s.io/argocd-applicationset-controller created
role.rbac.authorization.k8s.io/argocd-dex-server created
role.rbac.authorization.k8s.io/argocd-notifications-controller created
role.rbac.authorization.k8s.io/argocd-redis created
role.rbac.authorization.k8s.io/argocd-server created
clusterrole.rbac.authorization.k8s.io/argocd-application-controller created
clusterrole.rbac.authorization.k8s.io/argocd-applicationset-controller created
clusterrole.rbac.authorization.k8s.io/argocd-server created
rolebinding.rbac.authorization.k8s.io/argocd-application-controller created
rolebinding.rbac.authorization.k8s.io/argocd-applicationset-controller created
rolebinding.rbac.authorization.k8s.io/argocd-dex-server created
rolebinding.rbac.authorization.k8s.io/argocd-notifications-controller created
rolebinding.rbac.authorization.k8s.io/argocd-redis created
rolebinding.rbac.authorization.k8s.io/argocd-server created
clusterrolebinding.rbac.authorization.k8s.io/argocd-application-controller created
clusterrolebinding.rbac.authorization.k8s.io/argocd-applicationset-controller created
clusterrolebinding.rbac.authorization.k8s.io/argocd-server created
configmap/argocd-cm created
configmap/argocd-cmd-params-cm created
configmap/argocd-gpg-keys-cm created
configmap/argocd-notifications-cm created
configmap/argocd-rbac-cm created
configmap/argocd-ssh-known-hosts-cm created
configmap/argocd-tls-certs-cm created
secret/argocd-notifications-secret created
secret/argocd-secret created
service/argocd-applicationset-controller created
service/argocd-dex-server created
service/argocd-metrics created
service/argocd-notifications-controller-metrics created
service/argocd-redis created
service/argocd-repo-server created
service/argocd-server created
service/argocd-server-metrics created
deployment.apps/argocd-applicationset-controller created
deployment.apps/argocd-dex-server created
deployment.apps/argocd-notifications-controller created
deployment.apps/argocd-redis created
deployment.apps/argocd-repo-server created
deployment.apps/argocd-server created
statefulset.apps/argocd-application-controller created
networkpolicy.networking.k8s.io/argocd-application-controller-network-policy created
networkpolicy.networking.k8s.io/argocd-applicationset-controller-network-policy created
networkpolicy.networking.k8s.io/argocd-dex-server-network-policy created
networkpolicy.networking.k8s.io/argocd-notifications-controller-network-policy created
networkpolicy.networking.k8s.io/argocd-redis-network-policy created
networkpolicy.networking.k8s.io/argocd-repo-server-network-policy created
networkpolicy.networking.k8s.io/argocd-server-network-policy created
Waiting for deployment "argocd-server" rollout to finish: 0 of 1 updated replicas are available...
deployment "argocd-server" successfully rolled out
>>> Installing Istio
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   102  100   102    0     0    229      0 --:--:-- --:--:-- --:--:--   229
100  5124  100  5124    0     0   8243      0 --:--:-- --:--:-- --:--:--  8243

Downloading istio-1.28.1 from https://github.com/istio/istio/releases/download/1.28.1/istio-1.28.1-linux-arm64.tar.gz ...

Istio 1.28.1 download complete!

The Istio release archive has been downloaded to the istio-1.28.1 directory.

To configure the istioctl client tool for your workstation,
add the /root/paymesh/istio-1.28.1/bin directory to your environment path variable with:
	 export PATH="$PATH:/root/paymesh/istio-1.28.1/bin"

Begin the Istio pre-installation check by running:
	 istioctl x precheck 

Try Istio in ambient mode
	https://istio.io/latest/docs/ambient/getting-started/
Try Istio in sidecar mode
	https://istio.io/latest/docs/setup/getting-started/
Install guides for ambient mode
	https://istio.io/latest/docs/ambient/install/
Install guides for sidecar mode
	https://istio.io/latest/docs/setup/install/

Need more information? Visit https://istio.io/latest/docs/ 
        |\          
        | \         
        |  \        
        |   \       
      /||    \      
     / ||     \     
    /  ||      \    
   /   ||       \   
  /    ||        \  
 /     ||         \ 
/______||__________\
____________________
  \__       _____/  
     \_____/        

✔ Istio core installed ⛵️                                                                                                                                         
✔ Istiod installed 🧠                                                                                                                                             
✔ Ingress gateways installed 🛬                                                                                                                                   
✔ Egress gateways installed 🛫                                                                                                                                    
✔ Installation complete                                                                                                                                           
>>> Installing Prometheus & Grafana
"prometheus-community" already exists with the same configuration, skipping
Hang tight while we grab the latest from your chart repositories...
...Successfully got an update from the "strimzi" chart repository
...Successfully got an update from the "grafana" chart repository
...Successfully got an update from the "prometheus-community" chart repository
Update Complete. ⎈Happy Helming!⎈
Release "monitoring" does not exist. Installing it now.
>>> Installing Argo CD
deployment "argocd-server" successfully rolled out
>>> Installing Prometheus Operator CRDs
>>> Installing kube-prometheus-stack
"prometheus-community" already exists with the same configuration, skipping
Hang tight while we grab the latest from your chart repositories...
...Successfully got an update from the "strimzi" chart repository
...Successfully got an update from the "grafana" chart repository
...Successfully got an update from the "prometheus-community" chart repository
Update Complete. ⎈Happy Helming!⎈
Release "monitoring" does not exist. Installing it now.
NAME: monitoring
LAST DEPLOYED: Fri Dec 19 11:52:18 2025
NAMESPACE: monitoring
STATUS: deployed
REVISION: 1
NOTES:
kube-prometheus-stack has been installed. Check its status by running:
  kubectl --namespace monitoring get pods -l "release=monitoring"

Get Grafana 'admin' user password by running:

  kubectl --namespace monitoring get secrets monitoring-grafana -o jsonpath="{.data.admin-password}" | base64 -d ; echo

Access Grafana local instance:

  export POD_NAME=$(kubectl --namespace monitoring get pod -l "app.kubernetes.io/name=grafana,app.kubernetes.io/instance=monitoring" -oname)
  kubectl --namespace monitoring port-forward $POD_NAME 3000

Get your grafana admin user password by running:

  kubectl get secret --namespace monitoring -l app.kubernetes.io/component=admin-secret -o jsonpath="{.items[0].data.admin-password}" | base64 --decode ; echo


Visit https://github.com/prometheus-operator/kube-prometheus for instructions on how to create & configure Alertmanager and Prometheus instances using the Operator.
>>> Installing Strimzi Kafka Operator
"strimzi" already exists with the same configuration, skipping
Hang tight while we grab the latest from your chart repositories...
...Successfully got an update from the "strimzi" chart repository
...Successfully got an update from the "prometheus-community" chart repository
...Successfully got an update from the "grafana" chart repository
Update Complete. ⎈Happy Helming!⎈
NAME: strimzi-kafka-operator
LAST DEPLOYED: Fri Dec 19 11:53:09 2025
NAMESPACE: kafka
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
Thank you for installing strimzi-kafka-operator-0.49.1

To create a Kafka cluster refer to the following documentation.

https://strimzi.io/docs/operators/latest/deploying.html#deploying-cluster-operator-helm-chart-str
>>> Applying Argo CD Applications
application.argoproj.io/db-controller created
application.argoproj.io/payment-db created
application.argoproj.io/istio created
application.argoproj.io/kafka created
application.argoproj.io/monitoring created
application.argoproj.io/payment-api created
application.argoproj.io/payment-processor created
>>> Waiting for reconciliation
======================================
 SETUP COMPLETE
======================================

🔐 Argo CD:
kubectl port-forward --address 0.0.0.0 svc/argocd-server -n argocd 8081:443

URL: https://localhost:8081

Password: yKtVujhlBNcG6eNl

📊 Grafana:
kubectl port-forward svc/monitoring-grafana -n monitoring 3000:80

URL: http://localhost:3000

Password: kDCHiYzIUMAvaP2tIou4ed7HbYqL4znemWUxJ6l6

📈 Prometheus:
kubectl port-forward svc/monitoring-kube-prometheus-prometheus -n monitoring 9090:9090

URL: http://localhost:9090


echo "🌐 Istio Ingress:"

echo "kubectl get svc istio-ingressgateway -n istio-system"

echo "Use EXTERNAL-IP on port 80"

echo

