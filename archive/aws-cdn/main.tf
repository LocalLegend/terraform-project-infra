
terraform {

 backend "remote" {
    organization = "LocalLegend"

    workspaces {
      name = "aws-cdn"
    }
  }
  
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.69.0"
    }
  }
}

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}


resource "aws_s3_bucket" "media_bucket" {
  bucket = "locallegend-media"
  acl    = "private"

  versioning {
    enabled = true
  }

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "HEAD"]
    allowed_origins = ["*"]
    max_age_seconds = 86400
  }
}


resource "aws_s3_bucket_public_access_block" "media_bucket_public_access_block" {
  bucket                  = aws_s3_bucket.media_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_cloudfront_origin_access_identity" "media_oai" {
  comment = "media-origin-access-identity"
}


data "aws_iam_policy_document" "s3_oai_read_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.media_bucket.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.media_oai.iam_arn]
    }
  }
}

resource "aws_s3_bucket_policy" "s3_oai_asset_bucket_policy" {
  bucket = aws_s3_bucket.media_bucket.id
  policy = data.aws_iam_policy_document.s3_oai_read_policy.json
}


resource "aws_cloudfront_distribution" "media_cloudfront" {
  comment = "A CloudFront distribution to S3 media files"
  enabled = true

  web_acl_id = ""
  is_ipv6_enabled = true

  origin {
    domain_name = aws_s3_bucket.media_bucket.bucket_regional_domain_name
    origin_id   = "S3-media-bucket"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.media_oai.cloudfront_access_identity_path
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  default_cache_behavior {
    allowed_methods = ["GET", "HEAD", "OPTIONS"]
    cached_methods  = ["GET", "HEAD", "OPTIONS"]
    compress        = true
    default_ttl     = 30 * 24 * 60 * 60

    forwarded_values {
      query_string = true

      cookies {
        forward = "none"
      }
    }

    max_ttl                = 30 * 24 * 60 * 60 
    min_ttl                = 0
    target_origin_id       = "S3-media-bucket"
    viewer_protocol_policy = "redirect-to-https"
  }
}