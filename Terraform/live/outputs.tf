output "certificate_arn" {
  description = "ARN of the ACM certificate used for CloudFront distribution."
  value       = module.acm.certificate_arn
}

output "bucket_name" {
  description = "Name of the S3 bucket."
  value       = module.s3.bucket_name
}

output "bucket_regional_domain_name" {
  description = "Regional domain name of the S3 bucket."
  value       = module.s3.bucket_regional_domain_name
}

output "cloudfront_distribution_domain_name" {
  description = "Domain name of the CloudFront distribution."
  value       = module.cloudfront.distribution_domain_name
}

output "cloudfront_distribution_arn" {
  description = "ARN of the CloudFront distribution."
  value       = module.cloudfront.distribution_arn
}

output "route53_zone_id" {
  description = "Route53 hosted zone ID."
  value       = module.route53.zone_id
}