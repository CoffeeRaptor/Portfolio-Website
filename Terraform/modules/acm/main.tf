# Define ACM certificates and route53 records, and also verify the domain name ownership
resource "aws_acm_certificate" "website_cert" {
  #certificate should be in use1 to be recognized by cloudfront
  provider                  = aws.us_east_1
  domain_name               = var.domain_name
  validation_method         = "DNS"
  #simple conditional check to append the subdomain www to the domain name
  subject_alternative_names = var.subdomain != "" ? ["${var.subdomain}.${var.domain_name}"] : []
  #tags to track resources and cost
  tags = merge(var.tags, {
    Name = "${var.domain_name}-cert"
  })
}

resource "aws_route53_record" "cert_validation" {
  provider = aws.us_east_1
  for_each = var.enable_validation ? {
    # loops through the domain validation options in the acm cert with a map containing the values
    for dvo in aws_acm_certificate.website_cert.domain_validation_options : dvo.domain_name => {
      name  = dvo.resource_record_name
      type  = dvo.resource_record_type
      value = dvo.resource_record_value
    }
  } : {}

  #assigning the values from the loop
  zone_id = var.zone_id
  name    = each.value.name
  type    = each.value.type
  records = [each.value.value]
  ttl     = 60
}

resource "aws_acm_certificate_validation" "cert_validation" {
  #loops through each dns record and uses FQDN(complete domain name) to verify the dns records created in route53
  count = var.enable_validation ? 1:0
  certificate_arn         = aws_acm_certificate.website_cert.arn
  validation_record_fqdns = [for record in aws_route53_record.cert_validation : record.fqdn]
}

