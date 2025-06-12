locals {
  server_name = "${var.prefix}-redis"
}


resource "azurerm_redis_cache" "redis" {
  name                = local.server_name
  location            = var.location
  resource_group_name = var.resource_group_name

  capacity = var.capacity
  family   = var.family
  sku_name = var.sku_name

  non_ssl_port_enabled = false

  tags = var.tags

  redis_configuration {
  }
}
