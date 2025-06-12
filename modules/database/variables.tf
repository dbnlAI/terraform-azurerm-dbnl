variable "sku_name" {
  type        = string
  description = "Azure PostgreSQL Flexible Server SKU name (e.g., GP_Standard_D2s_v3)."
  default     = "GP_Standard_D2s_v3"
}

variable "db_name" {
  type        = string
  description = "Database name."
  default     = "dbnl"
}

variable "password" {
  type        = string
  description = "Database admin password."
  sensitive   = true
  default     = null
}

variable "username" {
  type        = string
  description = "Database admin username."
  default     = "dbnl"
  sensitive   = true
}

variable "delegated_subnet_id" {
  type        = string
  description = "The resource ID of the subnet delegated to the PostgreSQL Flexible Server."
}

variable "prefix" {
  type        = string
  description = "Name prefix to apply to named resources."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the Azure Resource Group where resources will be created."
}

variable "location" {
  type        = string
  description = "The Azure region where the PostgreSQL server will be deployed."
}

variable "postgresql_version" {
  type        = string
  description = "The version of PostgreSQL to deploy."
  default     = "15"
}

variable "storage_mb" {
  type        = number
  description = "The max storage allowed for the PostgreSQL server in megabytes."
  default     = 131072 # 128 GiB
}

variable "backup_retention_days" {
  type        = number
  description = "Backup retention period in days."
  default     = 7
}

variable "geo_redundant_backup_enabled" {
  type        = bool
  description = "Enable Geo-redundant backups."
  default     = false
}

variable "zone" {
  type        = string
  description = "Specifies the Availability Zone in which the Flexible Server should be created."
  default     = null # Let Azure pick if not specified, or e.g. "1"
}

variable "high_availability_enabled" {
  type        = bool
  description = "Enable high availability (zone-redundant)."
  default     = false
}

variable "standby_availability_zone" {
  type        = string
  description = "Specifies the Availability Zone for the standby server if high availability is enabled. Required if high_availability_enabled is true."
  default     = null

  validation {
    condition     = var.high_availability_enabled == false || (var.high_availability_enabled == true && var.standby_availability_zone != null)
    error_message = "standby_availability_zone must be set if high_availability_enabled is true."
  }
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the resources."
  default     = {}
}

variable "private_dns_zone_id" {
  description = "The ARM resource ID of the Private DNS Zone to associate with the PostgreSQL server. Required if VNet integration is used."
  type        = string
  default     = null
}

variable "autovacuum" {
  description = "Controls whether autovacuum is enabled for the PostgreSQL flexible server."
  type        = bool
  default     = true
}
