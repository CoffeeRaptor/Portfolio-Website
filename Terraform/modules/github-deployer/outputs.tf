output "access_key_id" {
  value       = aws_iam_access_key.this.id
  sensitive   = true
  description = "Use as AWS_ACCESS_KEY_ID in GitHub"
}

output "secret_access_key" {
  value       = aws_iam_access_key.this.secret
  sensitive   = true
  description = "Use as AWS_SECRET_ACCESS_KEY in GitHub"
}
