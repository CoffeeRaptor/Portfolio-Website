variable "bucket_name" {
  description = "The name of the S3 bucket."
  type        = string
  default = "shushanthsanjaykumar.com"
}

variable "cloudfront_distribution_arn" {
  description = "CloudFront distribution ARN to allow access."
  type        = string
}

variable "tags" {
  description = "Tags for resources."
  type        = map(string)
  default     = {}
}