locals {
  password          = coalesce(var.password, random_password.db.result)
  subnet_group_name = "${var.prefix}-db-subnet-group"
  server_name       = "${var.prefix}-pgflex"
}

resource "random_password" "db" {
  length  = 20
  special = false
}

resource "azurerm_postgresql_flexible_server" "pgflex" {
  name                          = local.server_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  version                       = var.postgresql_version
  delegated_subnet_id           = var.delegated_subnet_id
  private_dns_zone_id           = var.private_dns_zone_id
  public_network_access_enabled = false

  administrator_login    = var.username
  administrator_password = local.password

  zone       = var.zone
  storage_mb = var.storage_mb
  sku_name   = var.sku_name

  # High Availability
  dynamic "high_availability" {
    for_each = var.high_availability_enabled ? [1] : []
    content {
      mode                      = "ZoneRedundant"
      standby_availability_zone = var.standby_availability_zone
    }
  }

  # Backup
  backup_retention_days        = var.backup_retention_days
  geo_redundant_backup_enabled = var.geo_redundant_backup_enabled

  # Maintenance window (example, adjust as needed)
  maintenance_window {
    day_of_week  = 0 # Sunday
    start_hour   = 3
    start_minute = 0
  }

  lifecycle {
    ignore_changes = [
      zone
    ]
  }

  tags = var.tags
}

resource "azurerm_postgresql_flexible_server_database" "pgdb" {
  name      = var.db_name
  server_id = azurerm_postgresql_flexible_server.pgflex.id
  charset   = "UTF8"
  collation = "en_US.utf8"
}

resource "azurerm_postgresql_flexible_server_configuration" "autovacuum_config" {
  name      = "autovacuum"
  server_id = azurerm_postgresql_flexible_server.pgflex.id
  value     = var.autovacuum ? "on" : "off"
}
