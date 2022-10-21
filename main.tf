
provider "aws" {
  access_key = ""
  secret_key = ""
  region = "us-east-1"
}

variable "bucket_name"{
  type = string
  default = "test-terraform-bucket123213123312321"
}

resource "aws_s3_bucket" "create" {
  bucket = var.bucket_name
  
}

resource "aws_s3_bucket_website_configuration" "web" {
  bucket = aws_s3_bucket.create.bucket

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.create.bucket
  key = "index.html"
  source = "./index.html"
  content_type = "text/html"
  acl = "public-read"
}

# resource "aws_s3_object" "video" {
  
# }

# data "aws_acm_certificate" "kit_imi_sertificate" {
#   domain = "*.kit-imi.info" 
  
# }

# resource "aws_cloudfront_distribution" "cdn" {
#    origin {
#      domain_name = "tests3q12321.kit-imi.info"
#      origin_id = aws_s3_bucket.create.bucket_domain_name
#    }
#    enabled = true
#    default_root_object = "index.html"
#    restrictions {
#      geo_restriction {
#       restriction_type = "none"
#       locations        = [] 
#      }
#    }
#    default_cache_behavior {
#      target_origin_id = aws_s3_bucket.create.bucket_domain_name
#      cached_methods = ["GET", "HEAD"]
#      viewer_protocol_policy = "redirect-to-https"
#      allowed_methods = ["GET","HEAD"]
#    }

#   viewer_certificate {
#     acm_certificate_arn = "${data.aws_acm_certificate.kit_imi_sertificate.arn}"
#   }
# }