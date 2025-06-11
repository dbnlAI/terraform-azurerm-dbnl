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
  description = "The Azure region where the load balancer will be deployed."
}

variable "subnet_id" {
  type        = string
  description = "The subnet id where the load balancer will be deployed."
}

variable "private_ip_address" {
  type        = string
  description = "The private ip address for the load balancer."
}

variable "identity_id" {
  type        = string
  description = "The identity id to use with the load balancer."
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the storage account."
  default     = {}
}