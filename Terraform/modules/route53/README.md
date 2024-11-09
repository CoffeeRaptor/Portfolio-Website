# AWS Route 53 DNS Management Module

This Terraform module automates the setup of DNS records for the domain using AWS Route 53. It ensures that the root domain and `www` subdomain correctly point to the CloudFront distribution.

## What This Module Does

1. **Creates a Route 53 Hosted Zone**  
   Initializes a hosted zone for the specified domain, managing all associated DNS records within AWS.

2. **Configures Root Domain A Record with Alias**  
   Sets up an A record for the root domain (e.g., `example.com`) that aliases to the CloudFront distribution.

3. **Sets Up `www` Subdomain CNAME Record**  
   Establishes a CNAME record for the `www` subdomain (e.g., `www.example.com`) pointing to the CloudFront distribution, enabling consistent access via both root and `www` URLs.
