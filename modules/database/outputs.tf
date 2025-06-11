output "url" {
  description = "Database connection URL (excluding password for security)."
  value       = "postgresql+psycopg2://${azurerm_postgresql_flexible_server.pgflex.fqdn}:5432/${azurerm_postgresql_flexible_server_database.pgdb.name}"
}

output "host" {
  description = "Database host FQDN."
  value       = azurerm_postgresql_flexible_server.pgflex.fqdn
}

output "port" {
  description = "Database port."
  value       = 5432
}

output "database" {
  description = "Database name."
  value       = azurerm_postgresql_flexible_server_database.pgdb.name
}

output "username" {
  description = "Database administrator username."
  value       = azurerm_postgresql_flexible_server.pgflex.administrator_login
  sensitive   = true
}

output "password" {
  description = "The password for the PostgreSQL database. This is randomly generated if not provided as an input."
  value       = local.password
  sensitive   = true
}

output "server_id" {
  description = "The ID of the Azure PostgreSQL Flexible Server."
  value       = azurerm_postgresql_flexible_server.pgflex.id
}

output "database_id" {
  description = "The ID of the Azure PostgreSQL Database."
  value       = azurerm_postgresql_flexible_server_database.pgdb.id
}
