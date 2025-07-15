provider "azurerm" {
  features {}
}

provider "kubernetes" {
  host                   = module.dbnl.cluster_host
  cluster_ca_certificate = base64decode(module.dbnl.cluster_ca_certificate)
  client_key             = base64decode(module.dbnl.cluster_client_key)
  client_certificate     = base64decode(module.dbnl.cluster_client_certificate)
}

provider "helm" {
  kubernetes {
    host                   = module.dbnl.cluster_host
    cluster_ca_certificate = base64decode(module.dbnl.cluster_ca_certificate)
    client_key             = base64decode(module.dbnl.cluster_client_key)
    client_certificate     = base64decode(module.dbnl.cluster_client_certificate)
  }
}

# Generate a random dev key.
resource "tls_private_key" "dev" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

module "dbnl" {
  source = "../../"

  admin_password        = var.admin_password
  dev_token_private_key = tls_private_key.dev.private_key_pem
  domain                = var.domain
  instance_size         = "small"
  public_facing         = true
}
