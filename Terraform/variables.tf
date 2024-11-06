variable "aws_region" {
  description = "The AWS region where resources will be created."
  type        = string
  default     = "eu-central-1"
}

variable "domain_name" {
  description = "The primary domain name for the website."
  type        = string
  default     = "shushanthsanjaykumar.com"
}

variable "subdomain" {
  description = "The subdomain for the website (e.g., www)."
  type        = string
  default     = "www"
}

variable "environment" {
  description = "The environment for tagging purposes."
  type        = string
  default     = "Portfolio-Website"
}

variable "owner" {
  description = "The owner of the resources."
  type        = string
  default     = "Shushanth Sanjay Kumar"
}

variable "tags" {
  description = "A map of tags to assign to all resources."
  type        = map(string)
  default = {
    Environment = "Portfolio-Website"
    ManagedBy   = "Terraform"
    Owner       = "Shushanth Sanjay Kumar"
  }
}