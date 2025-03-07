provider "aws" {
  region = "eu-west-2"  // Ensure this matches your desired region
}

module "s3_buckets" {
  source = "../../module/s3_bucket"

  input_bucket_name  = "input-s-v1"
  output_bucket_name = "output-s-v1"
}

module "lambda_function" {
  source = "../../module/lambda"

  region              = "eu-west-2"
  lambda_function_name = "ReImage"
  lambda_runtime       = "python3.9"
  lambda_handler       = "lambda_function.lambda_handler"
  lambda_zip_path      = "E:/ResizeImage/module/lambda/pythoncode/lambda_function_payload.zip"
  
  input_bucket_arn    = module.s3_buckets.input_bucket_arn
}