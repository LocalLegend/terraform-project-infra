variable "gke_region" {
  description = "Google cloud platform region or zone"
  type        = string
  default     = "asia-northeast1-a"
}


variable "aws_region" {}
variable "aws_access_key" {}
variable "aws_secret_key" {}


variable "dynanodb_table_name_runners" {}
variable "mongodb_username" {}
variable "mongodb_password" {}
variable "postgres_db" {}
variable "postgres_user" {}
variable "postgres_password" {}


variable "keycloak_user" {}
variable "keycloak_password" {}

variable "rails_master_key" {}