locals {
  name = "${var.prefix}-aks-cluster"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = local.name
  location            = var.location
  resource_group_name = var.resource_group_name

  dns_prefix = local.name

  automatic_upgrade_channel = "stable"

  ingress_application_gateway {
    gateway_id = var.gateway_id
  }

  azure_policy_enabled      = true
  oidc_issuer_enabled       = true
  workload_identity_enabled = true

  default_node_pool {
    name           = "default"
    node_count     = var.desired_size
    vm_size        = var.instance_type
    vnet_subnet_id = var.private_subnet_id
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [var.identity_id]
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "azure"
  }

  tags = var.tags

  lifecycle {
    ignore_changes = [
      default_node_pool[0].upgrade_settings,
    ]
  }
}

# Assign permissions to the Application Gateway Ingress Controller to be able to manage the Application Gateway.
locals {
  ingress_gateway_principal_id = azurerm_kubernetes_cluster.aks.ingress_application_gateway[0].ingress_application_gateway_identity[0].object_id
}

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "azurerm_role_assignment" "resource_group" {
  scope                = data.azurerm_resource_group.rg.id
  role_definition_name = "Reader"
  principal_id         = local.ingress_gateway_principal_id
}

resource "azurerm_role_assignment" "gateway" {
  scope                = var.gateway_id
  role_definition_name = "Contributor"
  principal_id         = local.ingress_gateway_principal_id
}

resource "azurerm_role_assignment" "identity" {
  scope                = var.identity_id
  role_definition_name = "Managed Identity Operator"
  principal_id         = local.ingress_gateway_principal_id
}

resource "azurerm_role_assignment" "public_subnet" {
  scope                = var.public_subnet_id
  role_definition_name = "Contributor"
  principal_id         = local.ingress_gateway_principal_id
}