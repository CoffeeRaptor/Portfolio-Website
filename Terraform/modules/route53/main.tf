resource "aws_route53_zone" "main" {
  name = var.domain_name
}

resource "aws_route53_record" "main_domain" {
  zone_id = aws_route53_zone.main.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = var.cloudfront_distribution_domain_name
    zone_id                = var.cloudfront_distribution_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www_cname" {
  zone_id = aws_route53_zone.main.zone_id
  name    = var.subdomain
  type    = "CNAME"
  ttl     = 300
  records = [var.cloudfront_distribution_domain_name]
}