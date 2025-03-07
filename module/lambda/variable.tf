variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "eu-west-2"
}

variable "lambda_function_name" {
  description = "The name of the Lambda function"
  type        = string
  default     = "ReImage"
}

variable "lambda_runtime" {
  description = "The runtime for the Lambda function"
  type        = string
  default     = "python3.9"
}

variable "lambda_handler" {
  description = "The handler for the Lambda function"
  type        = string
  default     = "lambda_function.lambda_handler"
}

variable "lambda_zip_path" {
  description = "The path to the Lambda deployment package"
  type        = string
  default     = "E:/ResizeImage/module/lambda/pythoncode/lambda_function_payload.zip"
}
variable "input_bucket_arn" {
  description = "The ARN of the input S3 bucket"
  type        = string
}