variable "prefix" {
  type        = string
  description = "Name prefix to apply to named resources."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the storage account."
}

variable "location" {
  type        = string
  description = "The Azure region where the Redis server will be deployed."
}

variable "subnet_id" {
  type        = string
  description = "The subnet id where the Redis server will be deployed."
}

variable "capacity" {
  type        = number
  description = "The size of the Redis cache to deploy."
  default     = 2
}

variable "family" {
  type        = string
  description = "The SKU family/pricing group to use."
  default     = "C"
}

variable "sku_name" {
  type        = string
  description = "The SKU of Redis to use."
  default     = "Standard"
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the storage account."
  default     = {}
}