locals {
  default_identity_name = "${var.prefix}-identity"

  services = [
    "api-srv",
    "flower-srv",
    "migration-job",
    "worker-srv",
    "ui-srv"
  ]
}

resource "azurerm_user_assigned_identity" "default" {
  name                = local.default_identity_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_user_assigned_identity" "service_identities" {
  for_each = toset(local.services)

  name                = "${var.prefix}-${each.key}"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_federated_identity_credential" "service_service_accounts" {
  for_each = toset(local.services)

  name                = "${var.prefix}-${each.key}"
  resource_group_name = var.resource_group_name
  audience            = ["api://AzureADTokenExchange"]
  issuer              = var.cluster_oidc_issuer_url
  parent_id           = azurerm_user_assigned_identity.service_identities[each.key].id
  subject             = "system:serviceaccount:${var.helm_release_namespace}:${var.helm_release_name}-${each.key}"
}

resource "azurerm_role_assignment" "api_srv_blob_data_contributor" {
  scope                = var.abs_container_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_user_assigned_identity.service_identities["api-srv"].principal_id
}

resource "azurerm_role_assignment" "api_srv_blob_delegator" {
  # Delegator role needs to be set at the storage account level or higher.
  scope                = var.abs_storage_account_id
  role_definition_name = "Storage Blob Delegator"
  principal_id         = azurerm_user_assigned_identity.service_identities["api-srv"].principal_id
}

resource "azurerm_role_assignment" "worker_srv_blob_data_contributor" {
  scope                = var.abs_container_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_user_assigned_identity.service_identities["worker-srv"].principal_id
}
