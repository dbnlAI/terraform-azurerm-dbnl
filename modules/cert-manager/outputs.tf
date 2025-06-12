output "cluster_issuer" {
  description = "The name of the cert manager cluster issuer."
  value       = "cluster-issuer"
}

output "acme_challenge_type" {
  description = "ACME challenge type."
  value       = "http01"
}
