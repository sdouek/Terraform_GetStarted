# Variables

variable "aws_region" {
  description = "AWS region for resources"
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Name for the S3 bucket"
  default     = "Sara-bucket"
}

variable "lambda_name" {
  description = "Name for the Lambda function"
  default     = "Sara-lambda-function"
}
