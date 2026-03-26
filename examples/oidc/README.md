# OIDC deployment

This example shows how to create a dbnl deployment on Azure (AKS) using OIDC for authentication.

**!!!DO NOT USE THIS EXAMPLE IN PRODUCTION!!!**

## Prerequisites

- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) installed and authenticated (`az login`)
- An OIDC provider configured with a client application

## Required variables

| Variable | Description |
|---|---|
| `domain` | Domain to deploy dbnl to |
| `subscription_id` | Azure subscription ID to deploy into |
| `oidc_issuer` | OIDC issuer URL |
| `oidc_client_id` | OIDC client ID |
| `oidc_audience` | OIDC audience |
| `oidc_scopes` | OIDC scopes (default: `openid profile email`) |

## Usage

1. Run `terraform apply` with your variables:

    ```bash
    az login
    terraform apply -var-file=${TF_VARS_FILE}
    ```

2. Update your DNS to point a CNAME record to the load balancer hostname output by Terraform.
