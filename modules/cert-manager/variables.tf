variable "acme_email" {
  type        = string
  description = "Email address to use for ACME registration."
}

variable "acme_server" {
  type        = string
  description = "ACME server URL."
  default     = "https://acme-v02.api.letsencrypt.org/directory"
}

variable "acme_private_key_secret" {
  type        = string
  description = "Name of the Kubernetes secret that holds the private key for ACME."
  default     = "letsencrypt-secret"
}