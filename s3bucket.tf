resource "aws_s3_object" "bucket" {
  bucket = "elasticbeanstalk-eu-west-1-965560940386"
  key = "key"
  acl = "private"
  tags = {
    Name = "S3BucketIreland"
  }
}