variable "prefix" {
  description = "Prefix for all resources"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the virtual network."
  type        = string
}

variable "location" {
  description = "The Azure region where the virtual network will be created."
  type        = string
}

variable "vnet_cidr" {
  description = "The CIDR block for the virtual network."
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets."
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets."
  type        = list(string)
}

variable "database_subnet_cidrs" {
  description = "List of CIDR blocks for database subnets."
  type        = list(string)
}

variable "redis_subnet_cidrs" {
  description = "List of CIDR blocks for Redis (Azure Cache for Redis) subnets."
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
} 