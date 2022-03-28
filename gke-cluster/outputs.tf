output "host" {
  value = "https://${google_container_cluster.self.endpoint}"
}

output "ca_certificate" {
  value = base64decode(google_container_cluster.self.master_auth[0].cluster_ca_certificate)
}