# AWS S3 Bucket Module

This Terraform module automates the creation and configuration of an AWS S3 bucket tailored for hosting the website content.

## What This Module Does

1. **Creates a Secure S3 Bucket**  
   Sets up an S3 bucket with best practices for security, including private access settings to prevent public exposure of the website files.

2. **Integrates with CloudFront Distribution**  
   Configures the bucket to work with the CloudFront distribution using Origin Access Control (OAC), ensuring that only CloudFront can access the bucket contents.

3. **Configures Bucket Policy**  
   Automatically generates and applies a bucket policy that grants CloudFront the necessary permissions to retrieve content.
