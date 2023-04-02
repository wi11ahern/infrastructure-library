locals {
  account_id  = data.aws_caller_identity.current.account_id
  common_tags = {
    Environment = var.env
  }
}