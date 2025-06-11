module "vnet" {
  source  = "Azure/avm-res-network-virtualnetwork/azurerm"
  version = "~> 0.8.1"

  name                = "${var.prefix}-vnet"
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = [var.vnet_cidr]

  subnets = {
    public = {
      name             = "${var.prefix}-public-subnet"
      address_prefixes = var.public_subnet_cidrs
    }
    private = {
      name             = "${var.prefix}-private-subnet"
      address_prefixes = var.private_subnet_cidrs
    }
    database = {
      name             = "${var.prefix}-database-subnet"
      address_prefixes = var.database_subnet_cidrs
      delegation = [
        {
          name = "flexibleServersDelegation"
          service_delegation = {
            name = "Microsoft.DBforPostgreSQL/flexibleServers"
          }
        }
      ]
    }
    redis = {
      name             = "${var.prefix}-redis-subnet"
      address_prefixes = var.redis_subnet_cidrs
    }
  }

  tags = var.tags
}

resource "azurerm_private_dns_zone" "default" {
  name                = "${var.prefix}.postgres.database.azure.com"
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "default" {
  name                  = "${var.prefix}-pgvnetlink"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.default.name
  virtual_network_id    = module.vnet.resource_id
  tags                  = var.tags
}
