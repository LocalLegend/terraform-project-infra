variable "github_token" {
  description = "Github token for access control"
  type        = string
  sensitive   = true
}

variable "aws_access_key" {
  description = "Aws access_key_id for access aws resources"
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS secret_access_key for access aws resources"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "AWS region"
  type        = string
  default = "ap-northeast-1"
}

variable "source_bucket_name" {
  description = "Bucket for source"
  type        = string
  default = "locallegend-source"
}


variable "artefacts_bucket_name" {
  description = "Bucket for source"
  type        = string
  default = "locallegend-artefacts"
}


variable "title" {
  description = "Project main title"
  type        = string
  default = "LocalLegend"
}

variable "home_url" {
  description = "Project home url"
  type        = string
  default = "https://locallegend.ru"
}

variable "dynamodb_runners_name" {
  description = "Dynamodb runners name"
  type        = string
  default = "LL_Runners"
}



variable "aws_region" {}

variable "mongodb_username" {}
variable "mongodb_password" {}
variable "postgres_db" {}
variable "postgres_user" {}
variable "postgres_password" {}

variable "keycloak_user" {}
variable "keycloak_password" {}
variable "rails_master_key" {}

variable "npm_token" {
  description = "Github token for npm for semantic release"
}
