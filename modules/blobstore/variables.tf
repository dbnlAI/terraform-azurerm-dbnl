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
  description = "The Azure region where the storage account will be created."
}

variable "enable_blob_soft_delete" {
  type        = bool
  description = "Whether to enable soft delete for blobs. If true, deleted blobs are retained for a period."
  default     = false
}

variable "blob_soft_delete_retention_days" {
  type        = number
  description = "Number of days to retain soft-deleted blobs, if enabled."
  default     = 7
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the storage account."
  default     = {}
}
