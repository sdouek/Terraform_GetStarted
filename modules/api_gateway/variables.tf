# modules/api_gateway/variables.tf

variable "api_name" {
  description = "Name for the API Gateway"
}

variable "lambda_function_name" {
  description = "Name for the Lambda function to integrate with API Gateway"
}
