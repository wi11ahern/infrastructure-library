terraform {
  source = "../../../../../modules/api-gateway//messages-lambda"
}

locals {
  env_vars = yamldecode(file("${find_in_parent_folders("environment.yaml")}"))
}

inputs = {
  env         = local.env_vars["env"]
  lambda_name = "messenger"
}

