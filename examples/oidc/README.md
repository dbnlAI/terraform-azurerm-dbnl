# OIDC deployment

This example shows how to create an OIDC dbnl deployment to get familiar with the infrastructure and app.

**!!!DO NOT USE THIS EXAMPLE IN PRODUCTION!!!**

## Usage

1. Run terraform apply specifying your OIDC config, domain and registry credentials.

    ```bash
    az login
    terraform apply \
        -var-file=${TF_VARS_FILE} \
        -var="registry_username=${DBNL_REGISTRY_USERNAME}" \
        -var="registry_password=${DBNL_REGISTRY_PASSWORD}"
    ```
