# main.tf

# AWS Provider
provider "aws" {
  region = var.aws_region
}

# S3 Bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
  acl    = "private"
}

# Lambda Function
resource "aws_lambda_function" "my_lambda_function" {
  function_name = var.lambda_name
  handler       = "index.handler"
  runtime       = "nodejs14.x"
  filename      = "lambda_function.zip"
  source_code_hash = filebase64("lambda_function.zip")
}

# Lambda Permission to access S3
resource "aws_lambda_permission" "lambda_s3_permission" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.my_lambda_function.arn
  principal     = "s3.amazonaws.com"
}

# Module: API Gateway
module "api_gateway" {
  source = "./modules/api_gateway"
  api_name = var.api_name
  lambda_function_name =aws_lambda_function.my_lambda_function.lambda_name
}
