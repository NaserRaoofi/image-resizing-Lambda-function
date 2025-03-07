output "input_bucket_arn" {
  description = "The ARN of the input S3 bucket"
  value       = aws_s3_bucket.input_bucket.arn
}

output "output_bucket_arn" {
  description = "The ARN of the output S3 bucket"
  value       = aws_s3_bucket.output_bucket.arn
}