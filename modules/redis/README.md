<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_redis_cache.redis](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/redis_cache) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_capacity"></a> [capacity](#input\_capacity) | The size of the Redis cache to deploy. | `number` | `2` | no |
| <a name="input_family"></a> [family](#input\_family) | The SKU family/pricing group to use. | `string` | `"C"` | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure region where the Redis server will be deployed. | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Name prefix to apply to named resources. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the storage account. | `string` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | The SKU of Redis to use. | `string` | `"Standard"` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The subnet id where the Redis server will be deployed. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the storage account. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_database"></a> [database](#output\_database) | Redis database number |
| <a name="output_host"></a> [host](#output\_host) | Redis host |
| <a name="output_password"></a> [password](#output\_password) | Redis password |
| <a name="output_port"></a> [port](#output\_port) | Redis port |
| <a name="output_username"></a> [username](#output\_username) | Redis username |
<!-- END_TF_DOCS -->