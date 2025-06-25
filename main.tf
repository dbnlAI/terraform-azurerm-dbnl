locals {
  prefix = var.prefix == null ? random_pet.prefix.id : var.prefix
}

resource "random_pet" "prefix" {
  length = 1
}

resource "azurerm_resource_group" "rg" {
  name     = "${local.prefix}-rg"
  location = var.location
  tags     = var.tags
}

module "network" {
  source = "./modules/network"

  prefix              = local.prefix
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  vnet_cidr             = var.vnet_cidr
  public_subnet_cidrs   = var.public_subnet_cidrs
  private_subnet_cidrs  = var.private_subnet_cidrs
  database_subnet_cidrs = var.database_subnet_cidrs
  redis_subnet_cidrs    = var.redis_subnet_cidrs

  tags = var.tags
}

module "blobstore" {
  source = "./modules/blobstore"

  prefix              = local.prefix
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  enable_blob_soft_delete         = var.enable_blob_soft_delete
  blob_soft_delete_retention_days = var.blob_soft_delete_retention_days

  tags = var.tags
}

module "database" {
  source = "./modules/database"

  prefix              = local.prefix
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  sku_name = local.instance_types[var.instance_size].database

  private_dns_zone_id = module.network.private_dns_zone_id
  delegated_subnet_id = module.network.database_subnet_id

  tags = var.tags
}

module "redis" {
  source = "./modules/redis"

  prefix              = local.prefix
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  sku_name = local.instance_types[var.instance_size].redis.sku_name
  family   = local.instance_types[var.instance_size].redis.family
  capacity = local.instance_types[var.instance_size].redis.capacity

  subnet_id = module.network.redis_subnet_id

  tags = var.tags
}

module "loadbalancer" {
  source = "./modules/loadbalancer"

  prefix              = local.prefix
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  subnet_id          = module.network.public_subnet_id
  private_ip_address = var.private_ip_address

  identity_id = module.iam.default_identity_id

  tags = var.tags
}

module "kubernetes" {
  source = "./modules/kubernetes"

  prefix              = local.prefix
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  instance_type = local.instance_types[var.instance_size].kubernetes

  private_subnet_id = module.network.private_subnet_id
  public_subnet_id  = module.network.public_subnet_id

  gateway_id = module.loadbalancer.application_gateway_id

  identity_id = module.iam.default_identity_id

  tags = var.tags
}

module "iam" {
  source = "./modules/iam"

  prefix              = local.prefix
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  cluster_oidc_issuer_url = module.kubernetes.cluster_oidc_issuer_url

  abs_storage_account_id = module.blobstore.storage_account_id
  abs_container_id       = module.blobstore.storage_container_resource_manager_id

  helm_release_name      = var.helm_release_name
  helm_release_namespace = var.helm_release_namespace
}

module "cert_manager" {
  source = "./modules/cert-manager"

  acme_email = var.acme_email

  depends_on = [module.kubernetes]
}

module "app" {
  source = "./modules/app"

  admin_password = var.admin_password

  helm_chart_version     = var.helm_chart_version
  helm_release_name      = var.helm_release_name
  helm_release_namespace = var.helm_release_namespace

  db_host     = module.database.host
  db_port     = module.database.port
  db_database = module.database.database
  db_username = module.database.username
  db_password = module.database.password

  dev_token_private_key = var.dev_token_private_key

  domain = var.domain

  oidc_audience             = var.oidc_audience
  oidc_client_id            = var.oidc_client_id
  oidc_issuer               = var.oidc_issuer
  oidc_scopes               = var.oidc_scopes
  terms_of_service_disabled = var.terms_of_service_disabled

  prefix = local.prefix

  public_facing = var.public_facing

  redis_host     = module.redis.host
  redis_port     = module.redis.port
  redis_database = module.redis.database
  redis_username = module.redis.username
  redis_password = module.redis.password

  registry_server   = var.registry_server
  registry_username = var.registry_username
  registry_password = var.registry_password

  abs_storage_account_name = module.blobstore.storage_account_name
  abs_container            = module.blobstore.storage_container_name

  flower_enabled             = var.flower_enabled
  flower_basic_auth_password = var.flower_basic_auth_password
  flower_basic_auth_username = var.flower_basic_auth_username

  cert_manager_cluster_issuer      = module.cert_manager.cluster_issuer
  cert_manager_acme_challenge_type = module.cert_manager.acme_challenge_type

  service_identities = module.iam.service_identities

  depends_on = [
    module.kubernetes,
  ]
}
