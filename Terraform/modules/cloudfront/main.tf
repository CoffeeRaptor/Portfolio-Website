resource "aws_cloudfront_origin_access_control" "s3_access" {
  #defining OAC for cloudfront to access the s3 bucket with the website files
  name                              = "S3AccessControl-${var.bucket_name}"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "website_distribution" {
  # tfsec:ignore:aws-cloudfront-enable-waf:aws_cloudfront_distribution.website_distribution
  #origin configs to fetch the respective s3 bucket
  origin {
    domain_name              = var.bucket_regional_domain_name
    origin_id                = var.bucket_name
    origin_access_control_id = aws_cloudfront_origin_access_control.s3_access.id
    # the path inside the s3 bucket where the files are stored, for example a directory
    origin_path              = var.origin_path
  }

  #cloudfront can only be created in USE1. Refer aws documentation for more info
  provider = aws.us_east_1
  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"
  # Price class for US and Europe only
  price_class         = "PriceClass_100"
  #Cloutfront aliases configuration for it to respond to the right domain name requests. Ignoring these values will give an SSL/Crypto error
  aliases             = var.cloudfront_aliases


  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = var.bucket_name

    #redirecting http -> https to only allow secure connections
    viewer_protocol_policy = "redirect-to-https"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }

  viewer_certificate {
    acm_certificate_arn      = var.certificate_arn
    ssl_support_method       = "sni-only"
    #set to the latest and recommended tls version by cloudfront
    minimum_protocol_version = "TLSv1.2_2021"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = merge(var.tags, {
    Name = "${var.bucket_name}-distribution" #tags to track resources and cost
  })
}
