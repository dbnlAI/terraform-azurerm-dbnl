<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.cert_manager](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.cluster_issuer](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acme_email"></a> [acme\_email](#input\_acme\_email) | Email address to use for ACME registration. | `string` | n/a | yes |
| <a name="input_acme_private_key_secret"></a> [acme\_private\_key\_secret](#input\_acme\_private\_key\_secret) | Name of the Kubernetes secret that holds the private key for ACME. | `string` | `"letsencrypt-secret"` | no |
| <a name="input_acme_server"></a> [acme\_server](#input\_acme\_server) | ACME server URL. | `string` | `"https://acme-v02.api.letsencrypt.org/directory"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_acme_challenge_type"></a> [acme\_challenge\_type](#output\_acme\_challenge\_type) | ACME challenge type. |
| <a name="output_cluster_issuer"></a> [cluster\_issuer](#output\_cluster\_issuer) | The name of the cert manager cluster issuer. |
<!-- END_TF_DOCS -->