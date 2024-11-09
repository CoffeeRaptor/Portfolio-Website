# AWS CloudFront Distribution Module

This Terraform module sets up an AWS CloudFront distribution to deliver the website content from an S3 bucket.

## What This Module Does

1. **Configures Origin Access Control (OAC)**  
   Establishes an Origin Access Control to securely grant CloudFront access to the private S3 bucket.

2. **Creates a CloudFront Distribution**  
   Sets up a CloudFront distribution with optimized caching, HTTPS enforcement, and support for custom domain aliases.

3. **Integrates with Route 53 DNS Records**  
   Works in conjunction with Route 53 DNS records to map the domain and subdomains to the CloudFront distribution, and SSL/TLS security.
