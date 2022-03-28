provider helm {
  kubernetes {
    host  = "https://${google_container_cluster.self.endpoint}"
    token = data.google_client_config.provider.access_token
    cluster_ca_certificate = base64decode(google_container_cluster.self.master_auth[0].cluster_ca_certificate)
  }
}


resource "helm_release" "traefik" {
  name       = "traefik"
  namespace  = "traefik"
  repository = "https://helm.traefik.io/traefik"
  chart      = "traefik"

  values = [
    file("helm/traefik/values.yaml")
  ]

  depends_on = [
    kubernetes_namespace_v1.traefik
  ]

}