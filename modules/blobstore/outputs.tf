output "storage_account_name" {
  description = "The name of the Azure Storage Account."
  value       = azurerm_storage_account.storage_account.name
}

output "storage_account_id" {
  description = "The ID of the Azure Storage Account."
  value       = azurerm_storage_account.storage_account.id
}

output "storage_container_name" {
  description = "The name of the Azure Blob Storage Container."
  value       = azurerm_storage_container.data_container.name
}

output "storage_container_resource_manager_id" {
  description = "The ID of the Azure Blob Storage Container."
  value       = azurerm_storage_container.data_container.resource_manager_id
}

output "location" {
  description = "The Azure region where the resources are deployed."
  value       = azurerm_storage_account.storage_account.location
}

output "primary_blob_endpoint" {
  description = "The primary blob endpoint for the Azure Storage Account."
  value       = azurerm_storage_account.storage_account.primary_blob_endpoint
}