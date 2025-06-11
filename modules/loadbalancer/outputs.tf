output "application_gateway_id" {
  description = "The id of the created Azure Application Gateway."
  value       = azurerm_application_gateway.application_gateway.id
}
