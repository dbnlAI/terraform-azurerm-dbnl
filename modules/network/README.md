<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vnet"></a> [vnet](#module\_vnet) | Azure/avm-res-network-virtualnetwork/azurerm | ~> 0.8.1 |

## Resources

| Name | Type |
|------|------|
| [azurerm_private_dns_zone.default](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.default](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_database_subnet_cidrs"></a> [database\_subnet\_cidrs](#input\_database\_subnet\_cidrs) | List of CIDR blocks for database subnets. | `list(string)` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure region where the virtual network will be created. | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Prefix for all resources | `string` | n/a | yes |
| <a name="input_private_subnet_cidrs"></a> [private\_subnet\_cidrs](#input\_private\_subnet\_cidrs) | List of CIDR blocks for private subnets. | `list(string)` | n/a | yes |
| <a name="input_public_subnet_cidrs"></a> [public\_subnet\_cidrs](#input\_public\_subnet\_cidrs) | List of CIDR blocks for public subnets. | `list(string)` | n/a | yes |
| <a name="input_redis_subnet_cidrs"></a> [redis\_subnet\_cidrs](#input\_redis\_subnet\_cidrs) | List of CIDR blocks for Redis (Azure Cache for Redis) subnets. | `list(string)` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the virtual network. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the resources. | `map(string)` | `{}` | no |
| <a name="input_vnet_cidr"></a> [vnet\_cidr](#input\_vnet\_cidr) | The CIDR block for the virtual network. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_database_subnet_id"></a> [database\_subnet\_id](#output\_database\_subnet\_id) | The resource ID of the database subnet. Returns null if no database subnet is defined. |
| <a name="output_private_dns_zone_id"></a> [private\_dns\_zone\_id](#output\_private\_dns\_zone\_id) | The ID of the private DNS zone. |
| <a name="output_private_subnet_id"></a> [private\_subnet\_id](#output\_private\_subnet\_id) | The resource ID of the private subnet. Returns null if no private subnet is defined. |
| <a name="output_public_subnet_id"></a> [public\_subnet\_id](#output\_public\_subnet\_id) | The resource ID of the public subnet. Returns null if no public subnet is defined. |
| <a name="output_redis_subnet_id"></a> [redis\_subnet\_id](#output\_redis\_subnet\_id) | The resource ID of the redis subnet. Returns null if no redis subnet is defined. |
| <a name="output_subnets"></a> [subnets](#output\_subnets) | A map of the created subnets. |
| <a name="output_vnet_id"></a> [vnet\_id](#output\_vnet\_id) | The ID of the created Azure Virtual Network. |
| <a name="output_vnet_name"></a> [vnet\_name](#output\_vnet\_name) | The name of the created Azure Virtual Network. |
<!-- END_TF_DOCS -->