output "distribution_domain_name" {
  value = aws_cloudfront_distribution.website_distribution.domain_name
}

output "distribution_arn" {
  value = aws_cloudfront_distribution.website_distribution.arn
}

output "distribution_zone_id" {
  description = "Hosted Zone ID of the CloudFront distribution."
  value       = aws_cloudfront_distribution.website_distribution.hosted_zone_id
}

