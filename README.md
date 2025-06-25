<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 2.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 4.0 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_app"></a> [app](#module\_app) | ./modules/app | n/a |
| <a name="module_blobstore"></a> [blobstore](#module\_blobstore) | ./modules/blobstore | n/a |
| <a name="module_cert_manager"></a> [cert\_manager](#module\_cert\_manager) | ./modules/cert-manager | n/a |
| <a name="module_database"></a> [database](#module\_database) | ./modules/database | n/a |
| <a name="module_iam"></a> [iam](#module\_iam) | ./modules/iam | n/a |
| <a name="module_kubernetes"></a> [kubernetes](#module\_kubernetes) | ./modules/kubernetes | n/a |
| <a name="module_loadbalancer"></a> [loadbalancer](#module\_loadbalancer) | ./modules/loadbalancer | n/a |
| <a name="module_network"></a> [network](#module\_network) | ./modules/network | n/a |
| <a name="module_redis"></a> [redis](#module\_redis) | ./modules/redis | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [random_pet.prefix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acme_email"></a> [acme\_email](#input\_acme\_email) | Email address for ACME certificate registration. | `string` | `"acme@distributional.com"` | no |
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | Admin password. | `string` | `null` | no |
| <a name="input_blob_soft_delete_retention_days"></a> [blob\_soft\_delete\_retention\_days](#input\_blob\_soft\_delete\_retention\_days) | Number of days to retain soft-deleted blobs in the main storage account. | `number` | `7` | no |
| <a name="input_database_subnet_cidrs"></a> [database\_subnet\_cidrs](#input\_database\_subnet\_cidrs) | List of CIDR blocks for database subnets. | `list(string)` | <pre>[<br/>  "10.10.2.0/24"<br/>]</pre> | no |
| <a name="input_db_password"></a> [db\_password](#input\_db\_password) | Database password. | `string` | `null` | no |
| <a name="input_dev_token_private_key"></a> [dev\_token\_private\_key](#input\_dev\_token\_private\_key) | Private key used to sign dev tokens. | `string` | n/a | yes |
| <a name="input_domain"></a> [domain](#input\_domain) | App domain name. | `string` | n/a | yes |
| <a name="input_enable_blob_soft_delete"></a> [enable\_blob\_soft\_delete](#input\_enable\_blob\_soft\_delete) | Whether to enable soft delete for blobs in the main storage account. | `bool` | `true` | no |
| <a name="input_flower_basic_auth_password"></a> [flower\_basic\_auth\_password](#input\_flower\_basic\_auth\_password) | Flower basic auth password for UI access. | `string` | `null` | no |
| <a name="input_flower_basic_auth_username"></a> [flower\_basic\_auth\_username](#input\_flower\_basic\_auth\_username) | Flower basic auth username for UI access. | `string` | `null` | no |
| <a name="input_flower_enabled"></a> [flower\_enabled](#input\_flower\_enabled) | Whether to enable Flower monitoring for Celery queues. | `bool` | `false` | no |
| <a name="input_helm_chart_version"></a> [helm\_chart\_version](#input\_helm\_chart\_version) | Helm chart version. | `string` | `"0.23.4"` | no |
| <a name="input_helm_release_name"></a> [helm\_release\_name](#input\_helm\_release\_name) | Helm release name. | `string` | `"dbnl"` | no |
| <a name="input_helm_release_namespace"></a> [helm\_release\_namespace](#input\_helm\_release\_namespace) | Helm release namespace. | `string` | `"default"` | no |
| <a name="input_instance_size"></a> [instance\_size](#input\_instance\_size) | App instance size | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure region where all resources will be created. | `string` | `"Central US"` | no |
| <a name="input_oidc_audience"></a> [oidc\_audience](#input\_oidc\_audience) | OIDC audience. | `string` | `null` | no |
| <a name="input_oidc_client_id"></a> [oidc\_client\_id](#input\_oidc\_client\_id) | OIDC client id. | `string` | `null` | no |
| <a name="input_oidc_issuer"></a> [oidc\_issuer](#input\_oidc\_issuer) | OIDC issuer. | `string` | `null` | no |
| <a name="input_oidc_scopes"></a> [oidc\_scopes](#input\_oidc\_scopes) | OIDC scopes. | `string` | `"openid profile email"` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Prefix for all Azure resources. | `string` | `null` | no |
| <a name="input_private_ip_address"></a> [private\_ip\_address](#input\_private\_ip\_address) | The private IP address for the load balancer. Needs to be in the public subnet. | `string` | `"10.10.0.10"` | no |
| <a name="input_private_subnet_cidrs"></a> [private\_subnet\_cidrs](#input\_private\_subnet\_cidrs) | List of CIDR blocks for private subnets. | `list(string)` | <pre>[<br/>  "10.10.1.0/24"<br/>]</pre> | no |
| <a name="input_public_facing"></a> [public\_facing](#input\_public\_facing) | value | `bool` | `false` | no |
| <a name="input_public_subnet_cidrs"></a> [public\_subnet\_cidrs](#input\_public\_subnet\_cidrs) | List of CIDR blocks for public subnets. | `list(string)` | <pre>[<br/>  "10.10.0.0/24"<br/>]</pre> | no |
| <a name="input_redis_password"></a> [redis\_password](#input\_redis\_password) | Redis password. | `string` | `null` | no |
| <a name="input_redis_subnet_cidrs"></a> [redis\_subnet\_cidrs](#input\_redis\_subnet\_cidrs) | List of CIDR blocks for Redis subnets. | `list(string)` | <pre>[<br/>  "10.10.3.0/24"<br/>]</pre> | no |
| <a name="input_registry_password"></a> [registry\_password](#input\_registry\_password) | Artifact registry password. | `string` | n/a | yes |
| <a name="input_registry_server"></a> [registry\_server](#input\_registry\_server) | Artifact registry server. | `string` | `"us-docker.pkg.dev/dbnlai"` | no |
| <a name="input_registry_username"></a> [registry\_username](#input\_registry\_username) | Artifact registry username. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the resources. | `map(string)` | <pre>{<br/>  "Environment": "sandbox",<br/>  "ManagedBy": "Terraform",<br/>  "Project": "dbnl"<br/>}</pre> | no |
| <a name="input_terms_of_service_disabled"></a> [terms\_of\_service\_disabled](#input\_terms\_of\_service\_disabled) | Whether to disable the terms of service acceptance requirement. | `bool` | `false` | no |
| <a name="input_vnet_cidr"></a> [vnet\_cidr](#input\_vnet\_cidr) | The CIDR block for the virtual network. | `string` | `"10.10.0.0/16"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | The AKS cluster CA certificate. |
| <a name="output_cluster_client_certificate"></a> [cluster\_client\_certificate](#output\_cluster\_client\_certificate) | The AKS cluster client certificate. |
| <a name="output_cluster_client_key"></a> [cluster\_client\_key](#output\_cluster\_client\_key) | The AKS cluster client key. |
| <a name="output_cluster_host"></a> [cluster\_host](#output\_cluster\_host) | The AKS cluster host. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | The name of the Azure Resource Group. |
| <a name="output_subnets"></a> [subnets](#output\_subnets) | A map of the created subnets. |
| <a name="output_vnet_id"></a> [vnet\_id](#output\_vnet\_id) | The ID of the created Azure Virtual Network. |
| <a name="output_vnet_name"></a> [vnet\_name](#output\_vnet\_name) | The name of the created Azure Virtual Network. |
<!-- END_TF_DOCS -->