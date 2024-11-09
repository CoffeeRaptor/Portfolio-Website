# shushanthsanjaykumar.com

My personal website repository

## Architecture

The website is hosted on AWS and managed with Terraform. It is a very basic, yet secure setup for serving static files. A brief explanation:

- **Amazon S3**: Stores the static website files.
- **Amazon CloudFront**: Acts as a Content Delivery Network (CDN) to deliver content quickly to users around the globe.
- **AWS Certificate Manager (ACM)**: Handles SSL/TLS certificates for secure HTTPS connections.
- **Amazon Route 53**: Manages DNS records, directing traffic to the CloudFront distribution.

Terraform is used to define and provision these AWS resources

## Frontend Technologies

The frontend of the website is built using:

- **HTML5**: To structure the content of the website.
- **CSS3**: To style the website and ensures it is responsive across different devices.
- **JavaScript**: For interactivitiy and enhanced user experience

All frontend files are stored in the S3 bucket and served through CloudFront

---
