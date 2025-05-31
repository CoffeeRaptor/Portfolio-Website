module "route53" {
  source                              = "../modules/route53"
  domain_name                         = "shushanthsanjaykumar.com"
  subdomain                           = var.subdomain
  cloudfront_distribution_domain_name = module.cloudfront.distribution_domain_name
  cloudfront_distribution_zone_id     = module.cloudfront.distribution_zone_id
}

module "acm" {
  source      = "../modules/acm"
  domain_name = "shushanthsanjaykumar.com"
  subdomain   = var.subdomain
  tags        = var.tags
  zone_id     = module.route53.zone_id
}

module "s3" {
  source                      = "../modules/s3"
  bucket_name                 = "shushanthsanjaykumar.com"
  cloudfront_distribution_arn = module.cloudfront.distribution_arn
  tags                        = var.tags
}

module "cloudfront" {
  source                      = "../modules/cloudfront"
  bucket_name                 = module.s3.bucket_name
  bucket_regional_domain_name = module.s3.bucket_regional_domain_name
  certificate_arn             = module.acm.certificate_arn
  origin_path                 = "/WebsiteFiles"
  cloudfront_aliases          = ["shushanthsanjaykumar.com","www.shushanthsanjaykumar.com"]
  tags                        = var.tags
}

module "github_deployer"{
  source          = "../modules/github-deployer"
  user_name       = "github-actions-deployer"
  s3_bucket_name  = module.s3.bucket_name
}

module "dynamodb" {
  source      = "../modules/dynamodb"
  table_name  = "terraform-lock"
  tags        = var.tags
}


