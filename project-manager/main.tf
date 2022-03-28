terraform {

  backend "remote" {
    organization = "LocalLegend"

    workspaces {
      name = "project-manager"
    }
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "3.69.0"
    }
  }
}



provider "github" {
  token = var.github_token
  owner = "locallegend"
}

provider "aws" {
  region     = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}


resource "aws_s3_bucket" "source" {
  bucket = var.source_bucket_name
  acl    = "private"

  tags = {
    Name = "Source"
  }
}

resource "aws_s3_bucket" "artefacts" {
  bucket = var.artefacts_bucket_name
  acl    = "private"

  tags = {
    Name = "Artefacts"
  }
}



