 variable "environment" {
  default = "test"
  description = "Name of environment"
}

variable "region" {
  default = "eu-west-1"
  description = "AWS region"
}

variable "cluster_bucket_suffix" {
  default     = "test-build"
  type = string
  description = "Bucket where terraform states reside"
}

variable "cluster_key" {
  default = "application/terraform.tfstate"
  type = string
  description = "key to Cluster Terraform state location"
}

variable "cluster_name" {
  default = "test"
  type = string
}
