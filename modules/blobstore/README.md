<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_storage_account.storage_account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_container.data_container](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |
| [random_string.storage_account_suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_blob_soft_delete_retention_days"></a> [blob\_soft\_delete\_retention\_days](#input\_blob\_soft\_delete\_retention\_days) | Number of days to retain soft-deleted blobs, if enabled. | `number` | `7` | no |
| <a name="input_enable_blob_soft_delete"></a> [enable\_blob\_soft\_delete](#input\_enable\_blob\_soft\_delete) | Whether to enable soft delete for blobs. If true, deleted blobs are retained for a period. | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure region where the storage account will be created. | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Name prefix to apply to named resources. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the storage account. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the storage account. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_location"></a> [location](#output\_location) | The Azure region where the resources are deployed. |
| <a name="output_primary_blob_endpoint"></a> [primary\_blob\_endpoint](#output\_primary\_blob\_endpoint) | The primary blob endpoint for the Azure Storage Account. |
| <a name="output_storage_account_id"></a> [storage\_account\_id](#output\_storage\_account\_id) | The ID of the Azure Storage Account. |
| <a name="output_storage_account_name"></a> [storage\_account\_name](#output\_storage\_account\_name) | The name of the Azure Storage Account. |
| <a name="output_storage_container_name"></a> [storage\_container\_name](#output\_storage\_container\_name) | The name of the Azure Blob Storage Container. |
| <a name="output_storage_container_resource_manager_id"></a> [storage\_container\_resource\_manager\_id](#output\_storage\_container\_resource\_manager\_id) | The ID of the Azure Blob Storage Container. |
<!-- END_TF_DOCS -->