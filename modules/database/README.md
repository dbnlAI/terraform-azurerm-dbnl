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
| [azurerm_postgresql_flexible_server.pgflex](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server) | resource |
| [azurerm_postgresql_flexible_server_configuration.autovacuum_config](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server_configuration) | resource |
| [azurerm_postgresql_flexible_server_database.pgdb](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server_database) | resource |
| [random_password.db](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_autovacuum"></a> [autovacuum](#input\_autovacuum) | Controls whether autovacuum is enabled for the PostgreSQL flexible server. | `bool` | `true` | no |
| <a name="input_backup_retention_days"></a> [backup\_retention\_days](#input\_backup\_retention\_days) | Backup retention period in days. | `number` | `7` | no |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | Database name. | `string` | `"dbnl"` | no |
| <a name="input_delegated_subnet_id"></a> [delegated\_subnet\_id](#input\_delegated\_subnet\_id) | The resource ID of the subnet delegated to the PostgreSQL Flexible Server. | `string` | n/a | yes |
| <a name="input_geo_redundant_backup_enabled"></a> [geo\_redundant\_backup\_enabled](#input\_geo\_redundant\_backup\_enabled) | Enable Geo-redundant backups. | `bool` | `false` | no |
| <a name="input_high_availability_enabled"></a> [high\_availability\_enabled](#input\_high\_availability\_enabled) | Enable high availability (zone-redundant). | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure region where the PostgreSQL server will be deployed. | `string` | n/a | yes |
| <a name="input_password"></a> [password](#input\_password) | Database admin password. | `string` | `null` | no |
| <a name="input_postgresql_version"></a> [postgresql\_version](#input\_postgresql\_version) | The version of PostgreSQL to deploy. | `string` | `"15"` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Name prefix to apply to named resources. | `string` | n/a | yes |
| <a name="input_private_dns_zone_id"></a> [private\_dns\_zone\_id](#input\_private\_dns\_zone\_id) | The ARM resource ID of the Private DNS Zone to associate with the PostgreSQL server. Required if VNet integration is used. | `string` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the Azure Resource Group where resources will be created. | `string` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | Azure PostgreSQL Flexible Server SKU name (e.g., GP\_Standard\_D2s\_v3). | `string` | `"GP_Standard_D2s_v3"` | no |
| <a name="input_standby_availability_zone"></a> [standby\_availability\_zone](#input\_standby\_availability\_zone) | Specifies the Availability Zone for the standby server if high availability is enabled. Required if high\_availability\_enabled is true. | `string` | `null` | no |
| <a name="input_storage_mb"></a> [storage\_mb](#input\_storage\_mb) | The max storage allowed for the PostgreSQL server in megabytes. | `number` | `131072` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the resources. | `map(string)` | `{}` | no |
| <a name="input_username"></a> [username](#input\_username) | Database admin username. | `string` | `"dbnl"` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | Specifies the Availability Zone in which the Flexible Server should be created. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_database"></a> [database](#output\_database) | Database name. |
| <a name="output_database_id"></a> [database\_id](#output\_database\_id) | The ID of the Azure PostgreSQL Database. |
| <a name="output_host"></a> [host](#output\_host) | Database host FQDN. |
| <a name="output_password"></a> [password](#output\_password) | The password for the PostgreSQL database. This is randomly generated if not provided as an input. |
| <a name="output_port"></a> [port](#output\_port) | Database port. |
| <a name="output_server_id"></a> [server\_id](#output\_server\_id) | The ID of the Azure PostgreSQL Flexible Server. |
| <a name="output_url"></a> [url](#output\_url) | Database connection URL (excluding password for security). |
| <a name="output_username"></a> [username](#output\_username) | Database administrator username. |
<!-- END_TF_DOCS -->