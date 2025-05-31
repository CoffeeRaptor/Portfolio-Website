output "table_name" {
  description = "DynamoDB table name for Terraform locking"
  value       = aws_dynamodb_table.terraform_lock.name
}
