output "lambda_function_arn" {
  description = "The ARN of the Lambda function"
  value       = aws_lambda_function.reimage.arn
}

output "lambda_execution_role_arn" {
  description = "The ARN of the Lambda execution role"
  value       = aws_iam_role.lambda_exec_role.arn
}