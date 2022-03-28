
  terraform {

  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.5.0"
    }
  }


   backend "remote" {
    organization = "LocalLegend"

    workspaces {
      name = "gke-cluster"
    }
  }
}



provider "google" {
  credentials = file("gcp_creds.json")
  project = "locallegend"
  region  = "asia-northeast1"
  zone    = "asia-northeast1-a"
}

resource "google_service_account" "self" {
  account_id   = "locallegend-gke"
  display_name = "Service Account"
}

resource "google_container_cluster" "self" {
  name     = "locallegend-cluster"
  location = var.gke_region

  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "self" {
  name       = "locallegend-node-pool"
  location   = var.gke_region
  cluster    = google_container_cluster.self.name
  node_count = 2

  node_config {
    preemptible  = true
    machine_type = "e2-small"

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.self.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}


data "google_client_config" "provider" {}