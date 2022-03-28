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

variable "aws_region" {
  description = "AWS region"
  type        = string
}

