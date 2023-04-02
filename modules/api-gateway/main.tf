resource "aws_apigatewayv2_api" "api_gw" {
  name          = var.api_name
  protocol_type = var.api_protocol
}
resource "aws_apigatewayv2_stage" "stage" {
  api_id      = aws_apigatewayv2_api.api_gw.id
  name        = var.env
  auto_deploy = true
}

resource "aws_apigatewayv2_integration" "lambda_integration" {
  api_id             = aws_apigatewayv2_api.api_gw.id
  integration_type   = "AWS_PROXY"
  integration_method = "POST"
  integration_uri    = var.lambda_invoke_arn
}

resource "aws_apigatewayv2_route" "route" {
  api_id    = aws_apigatewayv2_api.api_gw.id
  route_key = "POST /messages"

  target = "integrations/${aws_apigatewayv2_integration.lambda_integration.id}"
}

resource "aws_lambda_permission" "lambda_permission" {
  statement_id  = "AllowAPIGateWayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_function_name
  principal     = "apigateway.amazonaws.com"

  # The /* part allows invocation from any stage, method and resource path
  # within API Gateway.
  source_arn = "${aws_apigatewayv2_api.api_gw.execution_arn}/*"
}