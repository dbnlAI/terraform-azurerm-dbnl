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
| [azurerm_kubernetes_cluster.aks](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster) | resource |
| [azurerm_role_assignment.gateway](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.identity](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.public_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_desired_size"></a> [desired\_size](#input\_desired\_size) | AKS cluster desired size. | `number` | `2` | no |
| <a name="input_gateway_id"></a> [gateway\_id](#input\_gateway\_id) | Application Gateway id to use for the AKS cluster ingress. | `string` | n/a | yes |
| <a name="input_identity_id"></a> [identity\_id](#input\_identity\_id) | The identity id to use with the AKS cluster. | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | AKS cluster instance type. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure region where the AKS cluster will be deployed. | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Name prefix to apply to named resources. | `string` | n/a | yes |
| <a name="input_private_subnet_id"></a> [private\_subnet\_id](#input\_private\_subnet\_id) | The private subnet id where the AKS cluster nodes will be deployed. | `string` | n/a | yes |
| <a name="input_public_subnet_id"></a> [public\_subnet\_id](#input\_public\_subnet\_id) | The public subnet id where the Application Gateway is deployed. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the storage account. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the storage account. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | Kubernetes cluster CA certificate |
| <a name="output_cluster_client_certificate"></a> [cluster\_client\_certificate](#output\_cluster\_client\_certificate) | Kubernetes cluster client certificate |
| <a name="output_cluster_client_key"></a> [cluster\_client\_key](#output\_cluster\_client\_key) | Kubernetes cluster client certificate |
| <a name="output_cluster_host"></a> [cluster\_host](#output\_cluster\_host) | Kubernetes cluster host |
| <a name="output_cluster_oidc_issuer_url"></a> [cluster\_oidc\_issuer\_url](#output\_cluster\_oidc\_issuer\_url) | Kubernetes cluster OIDC issuer URL |
<!-- END_TF_DOCS -->