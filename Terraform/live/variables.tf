variable "subdomain" {
  description = "The subdomain for the website (e.g., 'www')."
  type        = string
  default     = "www"
}

variable "tags" {
  description = "A map of tags to apply to resources."
  type        = map(string)
  default = {
    Service = "portfolio-website"
  }
}