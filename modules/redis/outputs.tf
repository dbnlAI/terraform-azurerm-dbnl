output "host" {
  description = "Redis host"
  value       = azurerm_redis_cache.redis.hostname
}

output "port" {
  description = "Redis port"
  value       = azurerm_redis_cache.redis.ssl_port
}

output "database" {
  description = "Redis database number"
  value       = 0
}

output "username" {
  description = "Redis username"
  value       = ""
  sensitive   = true
}

output "password" {
  description = "Redis password"
  value       = azurerm_redis_cache.redis.primary_access_key
  sensitive   = true
}