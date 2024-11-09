variable "bucket_name" {
  description = "The S3 bucket name."
  type        = string
}

variable "bucket_regional_domain_name" {
  description = "The regional domain name of the S3 bucket."
  type        = string
}

variable "certificate_arn" {
  description = "ARN of the ACM certificate for SSL/TLS."
  type        = string
}

variable "origin_path" {
  description = "Origin path for CloudFront."
  type        = string
}

variable "tags" {
  description = "Tags for resources."
  type        = map(string)
  default     = {}
}

variable "cloudfront_aliases" {
  description = "List of alternative domain names for the Cloudfront distribution"
  type = list(string)
  default = []
}