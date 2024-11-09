resource "aws_route53_zone" "main" {
  name = var.domain_name
}

resource "aws_route53_record" "main_domain" {
  zone_id = aws_route53_zone.main.zone_id
  name    = var.domain_name
  #have to use an A name record here as mapping root domains should only use A records (DNS standards)
  type    = "A"

  #to point the root domain to the cloudfront
  alias {
    name                   = var.cloudfront_distribution_domain_name
    zone_id                = var.cloudfront_distribution_zone_id
    evaluate_target_health = false
  }
}

#To redirect the subdomain with "www." also to the cloudfront distribution
resource "aws_route53_record" "www_cname" {
  zone_id = aws_route53_zone.main.zone_id
  name    = var.subdomain
  type    = "CNAME"
  ttl     = 300
  records = [var.cloudfront_distribution_domain_name]
}