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
| [azurerm_federated_identity_credential.service_service_accounts](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/federated_identity_credential) | resource |
| [azurerm_role_assignment.api_srv_blob_data_contributor](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.api_srv_blob_delegator](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.worker_srv_blob_data_contributor](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_user_assigned_identity.default](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |
| [azurerm_user_assigned_identity.service_identities](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_abs_container_id"></a> [abs\_container\_id](#input\_abs\_container\_id) | The ID of the Azure Blob Storage container. | `string` | n/a | yes |
| <a name="input_abs_storage_account_id"></a> [abs\_storage\_account\_id](#input\_abs\_storage\_account\_id) | The ID of the Azure Blob Storage account. | `string` | n/a | yes |
| <a name="input_cluster_oidc_issuer_url"></a> [cluster\_oidc\_issuer\_url](#input\_cluster\_oidc\_issuer\_url) | The OIDC issuer url of the kubernetes cluster. | `string` | n/a | yes |
| <a name="input_helm_release_name"></a> [helm\_release\_name](#input\_helm\_release\_name) | The name of the dbnl Helm release. | `string` | n/a | yes |
| <a name="input_helm_release_namespace"></a> [helm\_release\_namespace](#input\_helm\_release\_namespace) | The namespace of the dbnl Helm release. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure region where the AKS cluster will be deployed. | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Name prefix to apply to named resources. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the storage account. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_default_identity_id"></a> [default\_identity\_id](#output\_default\_identity\_id) | Identifier for the default user assigned identity. |
| <a name="output_service_identities"></a> [service\_identities](#output\_service\_identities) | User assigned identities for the services. |
<!-- END_TF_DOCS -->