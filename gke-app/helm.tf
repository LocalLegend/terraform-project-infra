provider helm {
  kubernetes {
    host  = data.terraform_remote_state.gke_cluster.outputs.host
    token = data.google_client_config.provider.access_token
    cluster_ca_certificate = data.terraform_remote_state.gke_cluster.outputs.ca_certificate
  }
}



resource "helm_release" "atlantic" {
  name       = "atlantic"
  chart      = "./helm/atlantic"

  set {
    name  = "AWS_REGION"
    value = var.aws_region
  }


  set {
    name  = "AWS_ACCESS_KEY"
    value = var.aws_access_key
  }

  set {
    name  = "AWS_SECRET_KEY"
    value = var.aws_secret_key
  }

  set {
    name  = "DYNANODB_TABLE_NAME_RUNNERS"
    value = var.dynanodb_table_name_runners
  }


  set {
    name  = "MONGODB_USERNAME"
    value = var.mongodb_username
  }


  set {
    name  = "MONGODB_PASSWORD"
    value = var.mongodb_password
  }


  set {
    name  = "POSTGRES_DB"
    value = var.postgres_db
  }

  set {
    name  = "POSTGRES_USER"
    value = var.postgres_user
  }

  set {
    name  = "POSTGRES_PASSWORD"
    value = var.postgres_password
  }

  set {
    name  = "KEYCLOAK_USER"
    value = var.keycloak_user
  }

  set {
    name  = "KEYCLOAK_PASSWORD"
    value = var.keycloak_password
  }

  set {
    name  = "RAILS_MASTER_KEY"
    value = var.rails_master_key
  }

  
}

# resource "helm_release" "atlantic1" {
#   name       = "atlantic1"
#   chart      = "./helm/atlantic1"
# }