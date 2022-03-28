
terraform {

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.5.0"
    }
  }


  backend "remote" {
    organization = "LocalLegend"

    workspaces {
      name = "gke-app"
    }
  }
}


data "terraform_remote_state" "gke_cluster" {
  backend = "remote"

  config = {
    organization = "LocalLegend"
    workspaces = {
      name = "gke-cluster"
    }
  }
}


provider "google" {
  credentials = file("gcp_creds.json")
  project     = "locallegend"
  region      = "asia-northeast1"
  zone        = "asia-northeast1-a"
}

data "google_client_config" "provider" {}