variable "input_bucket_name" {
  description = "The name of the input S3 bucket"
  type        = string
  default     = "input-s-v1"
}

variable "output_bucket_name" {
  description = "The name of the output S3 bucket"
  type        = string
  default     = "output-s-v1"
}