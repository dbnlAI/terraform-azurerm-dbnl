output "cluster_host" {
  description = "Kubernetes cluster host"
  value       = azurerm_kubernetes_cluster.aks.kube_config[0].host
}

output "cluster_client_key" {
  value       = azurerm_kubernetes_cluster.aks.kube_config[0].client_key
  description = "Kubernetes cluster client certificate"
}

output "cluster_client_certificate" {
  description = "Kubernetes cluster client certificate"
  value       = azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate
}

output "cluster_ca_certificate" {
  description = "Kubernetes cluster CA certificate"
  value       = azurerm_kubernetes_cluster.aks.kube_config[0].cluster_ca_certificate
}

output "cluster_oidc_issuer_url" {
  description = "Kubernetes cluster OIDC issuer URL"
  value       = azurerm_kubernetes_cluster.aks.oidc_issuer_url
}
