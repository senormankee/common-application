data "aws_region" "current" {}

output "current_region_name" {
  value = data.aws_region.current.name
}

data "aws_caller_identity" "current" {}

output "aws_account_id" {
  value = data.aws_caller_identity.current.account_id
}
