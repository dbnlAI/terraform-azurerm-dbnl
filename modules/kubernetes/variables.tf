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
  description = "The Azure region where the AKS cluster will be deployed."
}

variable "identity_id" {
  type        = string
  description = "The identity id to use with the AKS cluster."
}

variable "private_subnet_id" {
  type        = string
  description = "The private subnet id where the AKS cluster nodes will be deployed."
}

variable "public_subnet_id" {
  type        = string
  description = "The public subnet id where the Application Gateway is deployed."
}

variable "desired_size" {
  type        = number
  description = "AKS cluster desired size."
  default     = 2
}

variable "instance_type" {
  type        = string
  description = "AKS cluster instance type."
}

variable "gateway_id" {
  type        = string
  description = "Application Gateway id to use for the AKS cluster ingress."
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the storage account."
  default     = {}
}