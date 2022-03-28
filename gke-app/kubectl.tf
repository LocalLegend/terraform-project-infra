
provider "kubernetes" {
  host                   = data.terraform_remote_state.gke_cluster.outputs.host
  token                  = data.google_client_config.provider.access_token
  cluster_ca_certificate = data.terraform_remote_state.gke_cluster.outputs.ca_certificate
}