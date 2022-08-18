resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg.id]
  subnets            = [aws_subnet.dev-public-1.id,aws_subnet.dev-public-2.id]

  enable_deletion_protection = true

  access_logs {
    bucket  = aws_s3_bucket.s3.bucket
    prefix  = "test-lb"
    enabled = true
  }

  tags = {
    Environment = "production"
  }
}