output "vnet_id" {
  description = "The ID of the created Azure Virtual Network."
  value       = module.vnet.resource_id
}

output "vnet_name" {
  description = "The name of the created Azure Virtual Network."
  value       = module.vnet.name
}

output "subnets" {
  description = "A map of the created subnets."
  value       = module.vnet.subnets
}

output "public_subnet_id" {
  description = "The resource ID of the public subnet. Returns null if no public subnet is defined."
  value       = try(module.vnet.subnets["public"].resource_id, null)
}

output "private_subnet_id" {
  description = "The resource ID of the private subnet. Returns null if no private subnet is defined."
  value       = try(module.vnet.subnets["private"].resource_id, null)
}

output "database_subnet_id" {
  description = "The resource ID of the database subnet. Returns null if no database subnet is defined."
  value       = try(module.vnet.subnets["database"].resource_id, null)
}

output "redis_subnet_id" {
  description = "The resource ID of the redis subnet. Returns null if no redis subnet is defined."
  value       = try(module.vnet.subnets["redis"].resource_id, null)
}

output "private_dns_zone_id" {
  description = "The ID of the private DNS zone."
  value       = azurerm_private_dns_zone.default.id
}
