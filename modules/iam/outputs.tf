output "default_identity_id" {
  description = "Identifier for the default user assigned identity."
  value       = azurerm_user_assigned_identity.default.id
}

output "service_identities" {
  description = "User assigned identities for the services."
  value       = azurerm_user_assigned_identity.service_identities
}
