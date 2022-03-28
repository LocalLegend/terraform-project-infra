module "terraform-github-atlantic" {
  source = "github.com/locallegend/terraform-module-github-manager?ref=v1.0.4"

  repo = {
    name : "atlantic",
    description : "Backend API on Ruby On Rails",
    homepage_url : var.home_url
  }

  secrets_dev = [
    {
      "name" : "AWS_ACCESS_KEY",
      "value" : var.aws_access_key
    },
    {
      "name" : "AWS_SECRET_KEY",
      "value" : var.aws_secret_key
    },
    {
      "name" : "AWS_REGION",
      "value" : var.aws_region
    },
    {
      "name" : "RAILS_MASTER_KEY",
      "value" : var.rails_master_key
    },
    {
      "name" : "KEYCLOAK_USER",
      "value" : var.keycloak_user
    },
    {
      "name" : "KEYCLOAK_PASSWORD",
      "value" : var.keycloak_password
    },
    {
      "name" : "MONGODB_USERNAME",
      "value" : var.mongodb_username
    },
    {
      "name" : "MONGODB_PASSWORD",
      "value" : var.mongodb_password
    },
    {
      "name" : "POSTGRES_DB",
      "value" : var.postgres_db
    },
    {
      "name" : "POSTGRES_USER",
      "value" : var.postgres_user
    },
    {
      "name" : "POSTGRES_PASSWORD",
      "value" : var.postgres_password
    },
    {
      "name" : "DYNANODB_TABLE_NAME_RUNNERS",
      "value" : var.dynamodb_runners_name
    },
    {
      "name" : "GCP_CREDENTIALS",
      "value" : file("gcp_creds.json")
    },
  ]


  secrets_prod = [
    {
      "name" : "AWS_ACCESS_KEY",
      "value" : var.aws_access_key
    },
    {
      "name" : "AWS_SECRET_KEY",
      "value" : var.aws_secret_key
    },
    {
      "name" : "AWS_REGION",
      "value" : var.aws_region
    },
    {
      "name" : "RAILS_MASTER_KEY",
      "value" : var.rails_master_key
    },
    {
      "name" : "KEYCLOAK_USER",
      "value" : var.keycloak_user
    },
    {
      "name" : "KEYCLOAK_PASSWORD",
      "value" : var.keycloak_password
    },
    {
      "name" : "MONGODB_USERNAME",
      "value" : var.mongodb_username
    },
    {
      "name" : "MONGODB_PASSWORD",
      "value" : var.mongodb_password
    },
    {
      "name" : "POSTGRES_DB",
      "value" : var.postgres_db
    },
    {
      "name" : "POSTGRES_USER",
      "value" : var.postgres_user
    },
    {
      "name" : "POSTGRES_PASSWORD",
      "value" : var.postgres_password
    },
    {
      "name" : "DYNANODB_TABLE_NAME_RUNNERS",
      "value" : var.dynamodb_runners_name
    },
    {
      "name" : "GCP_CREDENTIALS",
      "value" : file("gcp_creds.json")
    },
  ]

}

module "terraform-github-catalyst" {
  source = "github.com/locallegend/terraform-module-github-manager?ref=v1.0.4"

  repo = {
    name : "catalyst",
    description : "React web app",
    homepage_url : var.home_url
  }
}


module "terraform-github-coalmining" {
  source = "github.com/locallegend/terraform-module-github-manager?ref=v1.0.4"

  repo = {
    name : "coalmining",
    description : "Serverless app for collect utmb scores for LocalLegend members",
    homepage_url : var.home_url
  }

  secrets = [
    {
      "name" : "AWS_ACCESS_KEY_ID",
      "value" : var.aws_access_key
    },
    {
      "name" : "AWS_SECRET_ACCESS_KEY",
      "value" : var.aws_secret_key
    }
  ]

}


module "terraform-github-project" {
  source = "github.com/locallegend/terraform-module-github-manager?ref=v1.0.4"

  repo = {
    name : "terraform-project-infra",
    description : "Terraform general infrastructure",
    homepage_url : var.home_url
  }

}


