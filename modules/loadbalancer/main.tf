locals {
  public_ip_name = "${var.prefix}-public-ip"

  gateway_name = "${var.prefix}-app-gateway"

  ip_configuration_name          = "${var.prefix}-app-gateway-ipconfig"
  frontend_ip_configuration_name = "${var.prefix}-app-gateway-feipconfig"
  frontend_port_name             = "${var.prefix}-app-gateway-feport"
  backend_address_pool_name      = "${var.prefix}-app-gateway-beaddresspool"
  backend_http_settings_name     = "${var.prefix}-app-gateway-behttpsettings"
  http_listener_name             = "${var.prefix}-app-gateway-httplistener"
  request_routing_rule_name      = "${var.prefix}-app-gateway-reqroutingrule"
  ssl_certificate_name           = "${var.prefix}-app-gateway-sslcert"
}


resource "azurerm_public_ip" "public_ip" {
  name                = local.public_ip_name
  resource_group_name = var.resource_group_name
  location            = var.location

  sku               = "Standard"
  allocation_method = "Static"

  tags = var.tags
}

resource "azurerm_application_gateway" "application_gateway" {
  name                = local.gateway_name
  resource_group_name = var.resource_group_name
  location            = var.location

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = local.ip_configuration_name
    subnet_id = var.subnet_id
  }

  frontend_port {
    name = local.frontend_port_name
    port = 80
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.public_ip.id
  }

  frontend_ip_configuration {
    name                          = "${local.frontend_ip_configuration_name}-private"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Static"
    private_ip_address            = var.private_ip_address
  }

  backend_address_pool {
    name = local.backend_address_pool_name
  }

  backend_http_settings {
    name                  = local.backend_http_settings_name
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = local.http_listener_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = local.request_routing_rule_name
    priority                   = 9
    rule_type                  = "Basic"
    http_listener_name         = local.http_listener_name
    backend_address_pool_name  = local.backend_address_pool_name
    backend_http_settings_name = local.backend_http_settings_name
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [var.identity_id]
  }

  lifecycle {
    # Those resources are managed by the application gateway controller.
    ignore_changes = [
      backend_address_pool,
      backend_http_settings,
      frontend_port,
      http_listener,
      probe,
      redirect_configuration,
      request_routing_rule,
      ssl_certificate,
      tags,
      url_path_map,
    ]
  }

  tags = var.tags
}