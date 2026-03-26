# Basic deployment

This example shows how to create a basic dbnl deployment on Azure (AKS) using username/password authentication.

**!!!DO NOT USE THIS EXAMPLE IN PRODUCTION!!!**

## Prerequisites

- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) installed and authenticated (`az login`)

## Required variables

| Variable | Description |
|---|---|
| `admin_password` | Password for the dbnl admin user |
| `domain` | Domain to deploy dbnl to |
| `subscription_id` | Azure subscription ID to deploy into |

## Usage

1. Run `terraform apply` with your variables:

    ```bash
    az login
    terraform apply -var-file=${TF_VARS_FILE}
    ```

2. Update your DNS to point a CNAME record to the load balancer hostname output by Terraform.
