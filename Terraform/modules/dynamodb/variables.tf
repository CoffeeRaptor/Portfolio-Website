variable "table_name" {
  description = "Name of the DynamoDB table for Terraform locking"
  type        = string
}

variable "tags" {
  description = "Tags to assign to resources"
  type        = map(string)
  default     = {}
}
