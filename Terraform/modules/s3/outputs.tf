output "bucket_name" {
  value = aws_s3_bucket.website_bucket.bucket
}

output "bucket_regional_domain_name" {
  value = aws_s3_bucket.website_bucket.bucket_regional_domain_name
}