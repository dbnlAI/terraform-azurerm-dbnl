resource "random_string" "storage_account_suffix" {
  length  = 8
  special = false
  upper   = false
}

locals {
  # only lowercase letters and numbers are allowed in the storage account name
  storage_account_name = "${replace(lower(var.prefix), "/[^a-z0-9]/", "")}sa${random_string.storage_account_suffix.result}"
}

resource "azurerm_storage_account" "storage_account" {
  name                     = local.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  blob_properties {
    delete_retention_policy {
      days = var.enable_blob_soft_delete ? var.blob_soft_delete_retention_days : null
    }
  }

  tags = var.tags
}

resource "azurerm_storage_container" "data_container" {
  name                  = "${var.prefix}-data"
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "private"
}