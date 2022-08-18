resource "aws_s3_bucket" "s3" {
  bucket = "gopi-tf-test-bucket"

  tags = {
    Name        = "gopi bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.s3.id
  acl    = "public-read-write"
}