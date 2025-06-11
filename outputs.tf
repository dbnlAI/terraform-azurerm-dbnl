output "resource_group_name" {
  description = "The name of the Azure Resource Group."
  value       = azurerm_resource_group.rg.name
}

output "vnet_id" {
  description = "The ID of the created Azure Virtual Network."
  value       = module.network.vnet_id
}

output "vnet_name" {
  description = "The name of the created Azure Virtual Network."
  value       = module.network.vnet_name
}

output "subnets" {
  description = "A map of the created subnets."
  value       = module.network.subnets
}

output "cluster_host" {
  description = "The AKS cluster host."
  value       = module.kubernetes.cluster_host
}

output "cluster_client_certificate" {
  description = "The AKS cluster client certificate."
  value       = module.kubernetes.cluster_client_certificate
}

output "cluster_client_key" {
  description = "The AKS cluster client key."
  value       = module.kubernetes.cluster_client_key
}

output "cluster_ca_certificate" {
  description = "The AKS cluster CA certificate."
  value       = module.kubernetes.cluster_ca_certificate
}
