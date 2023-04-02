variable env {
  type        = string
  default     = "dev"
  description = "The SDLC environment. Valid values are 'dev', 'test', and 'prod'."
}

variable api_name {
  type        = string
  description = "The name of the API."
}

variable api_protocol {
  type        = string
  default     = "HTTP"
  description = "The type of API to create. Valid values are 'HTTP' or 'WEBSOCKET'."
}

variable lambda_function_name {
  type        = string
  description = "The name of the lambda function to use in the integration."
}
variable lambda_invoke_arn {
  type        = string
  description = "The invokeable ARN of the lambda function integration."
}