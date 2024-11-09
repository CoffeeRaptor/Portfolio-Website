# AWS Certificate Manager (ACM) Terraform Module

This Terraform module automates the provisioning and management of SSL/TLS certificates using AWS Certificate Manager (ACM). It ensures secure communication for your domains with minimal manual effort.

## What This Module Does

1. **Request ACM Certificates**  
   Automatically requests SSL/TLS certificates for your specified domain and optional subdomains using DNS validation.

2. **Configure DNS Validation Records**  
   Creates the necessary Route 53 DNS CNAME records to validate domain ownership, eliminating the need for manual DNS setup.

3. **Validate and Issue Certificates**  
   Handles the certificate validation process, automatically issuing certificates once DNS records are correctly configured.





![image](https://github.com/user-attachments/assets/7e5aeb1c-867f-4d77-8221-07fa746e9484)
