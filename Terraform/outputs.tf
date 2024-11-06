output "cloudfront_domain_name" {
  description = "The domain name of the CloudFront distribution."
  value       = aws_cloudfront_distribution.website_distribution.domain_name
}

output "s3_bucket_name" {
  description = "The name of the S3 bucket for website hosting."
  value       = aws_s3_bucket.website_bucket.bucket
}

output "route53_zone_id" {
  description = "The ID of the Route53 hosted zone."
  value       = aws_route53_zone.main.zone_id
}