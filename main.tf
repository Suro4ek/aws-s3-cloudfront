provider "aws" {
  access_key = ""
  secret_key = ""
  region = "sa-east-1"
}

resource "aws_s3_bucket" "create" {
  bucket = "test-terraform-bucket"
}

resource "aws_s3_bucket_website_configuration" "web" {
  bucket = aws_s3_bucket.create.bucket

  index_document {
    suffix = "index.html"
  }

  
}

resource "aws_s3_bucket_acl" "acl_rule" {
  bucket = aws_s3_bucket.create.id
  acl = "public-read"
}

resource "aws_s3_object" "index" {
  
}

resource "aws_s3_object" "video" {
  
}