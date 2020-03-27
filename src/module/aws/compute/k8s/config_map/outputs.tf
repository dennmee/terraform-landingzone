output "uid" {
  description = "The unique in time and space value for this config map."
  value       = kubernetes_config_map.this.metadata[0].uid
}
