variable "domain_name" {
  description = "The domain name for Route 53."
  type        = string
}

variable "subdomain" {
  description = "Subdomain for Route 53."
  type        = string
  default     = "www"
}

variable "cloudfront_distribution_domain_name" {
  description = "CloudFront distribution domain name."
  type        = string
}

variable "cloudfront_distribution_zone_id" {
  description = "CloudFront distribution hosted zone ID."
  type        = string
}