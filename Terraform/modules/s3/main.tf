resource "aws_s3_bucket" "website_bucket" {
  bucket        = var.bucket_name
  force_destroy = true

  tags = merge(var.tags, {
    Name = "Website Bucket"
  })
}

resource "aws_s3_bucket_public_access_block" "website_public_access_block" {
  bucket                  = aws_s3_bucket.website_bucket.id
  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = false
  restrict_public_buckets = false
}

data "aws_iam_policy_document" "s3_bucket_policy" {
  statement {
    actions = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.website_bucket.arn}/*"]
    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }
    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"
      values   = [var.cloudfront_distribution_arn]
    }
  }
}

resource "aws_s3_bucket_policy" "website_bucket_policy" {
  bucket = var.bucket_name
  policy = data.aws_iam_policy_document.s3_bucket_policy.json
}