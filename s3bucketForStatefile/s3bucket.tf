# configured aws provider with proper credentials
provider "aws" {
  region    = "us-west-1"
  profile   = "asher"
}



resource "aws_s3_bucket" "example" {
  bucket = "deploy-jenkins"

  lifecycle {
    prevent_destroy = false
  }
}


resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.example.id
  versioning_configuration {
    status = "Enabled"
  }
}
