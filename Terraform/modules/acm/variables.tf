variable "domain_name" {
  description = "The domain name for the ACM certificate."
  type        = string
}

variable "subdomain" {
  description = "Optional subdomain for the ACM certificate."
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags for resources."
  type        = map(string)
  default     = {}
}

variable "zone_id" {
  description = "Route53 Zone ID for domain validation."
  type        = string
}
