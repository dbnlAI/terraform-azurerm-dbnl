variable "prefix" {
  description = "Prefix for all Azure resources."
  type        = string
  default     = null
}

variable "location" {
  description = "The Azure region where all resources will be created."
  type        = string
  default     = "Central US"
}

variable "vnet_cidr" {
  description = "The CIDR block for the virtual network."
  type        = string
  default     = "10.10.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets."
  type        = list(string)
  default     = ["10.10.0.0/24"]
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets."
  type        = list(string)
  default     = ["10.10.1.0/24"]
}

variable "database_subnet_cidrs" {
  description = "List of CIDR blocks for database subnets."
  type        = list(string)
  default     = ["10.10.2.0/24"]
}

variable "redis_subnet_cidrs" {
  description = "List of CIDR blocks for Redis subnets."
  type        = list(string)
  default     = ["10.10.3.0/24"]
}

variable "private_ip_address" {
  description = "The private IP address for the load balancer. Needs to be in the public subnet."
  type        = string
  default     = "10.10.0.10"
}

variable "enable_blob_soft_delete" {
  description = "Whether to enable soft delete for blobs in the main storage account."
  type        = bool
  default     = true
}

variable "blob_soft_delete_retention_days" {
  description = "Number of days to retain soft-deleted blobs in the main storage account."
  type        = number
  default     = 7
}

variable "admin_password" {
  type        = string
  description = "Admin password."
  default     = null
  sensitive   = true
}

variable "oidc_audience" {
  type        = string
  description = "OIDC audience."
  default     = null
}

variable "oidc_client_id" {
  type        = string
  description = "OIDC client id."
  default     = null
}

variable "oidc_issuer" {
  type        = string
  description = "OIDC issuer."
  default     = null
}

variable "oidc_scopes" {
  type        = string
  description = "OIDC scopes."
  default     = "openid profile email"
}

variable "db_password" {
  type        = string
  description = "Database password."
  sensitive   = true
  default     = null
}

variable "redis_password" {
  type        = string
  description = "Redis password."
  sensitive   = true
  default     = null
}

variable "dev_token_private_key" {
  type        = string
  description = "Private key used to sign dev tokens."
  sensitive   = true
}

variable "domain" {
  type        = string
  description = "App domain name."
}

variable "public_facing" {
  type        = bool
  description = "value"
  default     = false
}

variable "flower_enabled" {
  type        = bool
  description = "Whether to enable Flower monitoring for Celery queues."
  default     = false
}

variable "flower_basic_auth_password" {
  type        = string
  description = "Flower basic auth password for UI access."
  sensitive   = true
  default     = null
}

variable "flower_basic_auth_username" {
  type        = string
  description = "Flower basic auth username for UI access."
  sensitive   = true
  default     = null
}

variable "helm_chart_version" {
  type        = string
  description = "Helm chart version."
  default     = "0.23.4"
}

variable "helm_release_name" {
  type        = string
  description = "Helm release name."
  default     = "dbnl"
}

variable "helm_release_namespace" {
  type        = string
  description = "Helm release namespace."
  default     = "default"
}

variable "instance_size" {
  type        = string
  description = "App instance size"
  validation {
    condition     = contains(["small", "medium"], var.instance_size)
    error_message = "Invalid instance size. Valid values are 'small' or 'medium'."
  }
}

variable "registry_server" {
  type        = string
  description = "Artifact registry server."
  default     = "us-docker.pkg.dev/dbnlai"
}

variable "registry_username" {
  type        = string
  description = "Artifact registry username."
  sensitive   = true
}

variable "registry_password" {
  type        = string
  description = "Artifact registry password."
  sensitive   = true
}

variable "acme_email" {
  type        = string
  description = "Email address for ACME certificate registration."
  default     = "acme@distributional.com"
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default = {
    Environment = "sandbox"
    Project     = "dbnl"
    ManagedBy   = "Terraform"
  }
}