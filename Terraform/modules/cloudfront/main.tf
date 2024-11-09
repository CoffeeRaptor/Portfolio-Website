resource "aws_cloudfront_origin_access_control" "s3_access" {
  name                         = "S3AccessControl-${var.bucket_name}"
  origin_access_control_origin_type = "s3"
  signing_behavior             = "always"
  signing_protocol             = "sigv4"
}

resource "aws_cloudfront_distribution" "website_distribution" {
  origin {
    domain_name              = var.bucket_regional_domain_name
    origin_id                = var.bucket_name
    origin_access_control_id = aws_cloudfront_origin_access_control.s3_access.id
    origin_path              = var.origin_path
  }

  provider = aws.us_east_1
  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"
  price_class         = "PriceClass_100" # Price class for US and Europe only

  aliases             = var.cloudfront_aliases


  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = var.bucket_name

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
    minimum_protocol_version = "TLSv1.2_2021"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = merge(var.tags, {
    Name = "${var.bucket_name}-distribution"
  })
}
