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

variable "cluster_oidc_issuer_url" {
  type        = string
  description = "The OIDC issuer url of the kubernetes cluster."
}

variable "helm_release_name" {
  type        = string
  description = "The name of the dbnl Helm release."
}

variable "helm_release_namespace" {
  type        = string
  description = "The namespace of the dbnl Helm release."
}

variable "abs_storage_account_id" {
  type        = string
  description = "The ID of the Azure Blob Storage account."
}

variable "abs_container_id" {
  type        = string
  description = "The ID of the Azure Blob Storage container."
}