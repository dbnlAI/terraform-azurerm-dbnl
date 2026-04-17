output "resource_group_name" {
  description = "The name of the Azure Resource Group."
  value       = module.dbnl.resource_group_name
}

output "cluster_name" {
  description = "The AKS cluster name."
  value       = module.dbnl.cluster_name
}
