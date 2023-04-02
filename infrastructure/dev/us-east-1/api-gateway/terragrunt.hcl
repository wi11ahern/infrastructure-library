terraform {
  source = "../../../../modules//api-gateway"
}

dependency "messages_lambda" {
  config_path = "./messages-lambda"
  mock_outputs = {
    invoke_arn    = ""
    function_name = "messenger"
  }
}

locals {
  env_vars = yamldecode(file("${find_in_parent_folders("environment.yaml")}"))
}

inputs = {
  env                  = local.env_vars["env"]
  api_name             = "sandbox"
  lambda_invoke_arn    = dependency.messages_lambda.outputs.invoke_arn 
  lambda_function_name = dependency.messages_lambda.outputs.function_name 
}

include "root" {
  path = find_in_parent_folders()
}