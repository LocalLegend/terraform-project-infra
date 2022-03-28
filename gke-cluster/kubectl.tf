
provider "kubernetes" {
  host  = "https://${google_container_cluster.self.endpoint}"
  token = data.google_client_config.provider.access_token
  cluster_ca_certificate = base64decode(google_container_cluster.self.master_auth[0].cluster_ca_certificate)
}


resource "kubernetes_namespace_v1" "traefik" {
  metadata {
    name = "traefik"
  }
}