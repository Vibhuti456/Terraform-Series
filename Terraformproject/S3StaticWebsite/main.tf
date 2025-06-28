#create s3 bucket
resource "aws_s3_bucket" "mybucket" {
  bucket = var.s3_bucket
}

#Ownerships of controllong object
resource "aws_s3_bucket_ownership_controls" "bucket_owwner" {
  bucket = aws_s3_bucket.mybucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

#Providing the public Access
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.mybucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

#ACLS  details
resource "aws_s3_bucket_acl" "example" {
  depends_on = [ aws_s3_bucket_ownership_controls.bucket_owwner, aws_s3_bucket_public_access_block.example ]

  bucket = aws_s3_bucket.mybucket.id
  acl = "public-read"
}

#S3 object resource
resource "aws_s3_bucket_object" "index" {
     bucket = aws_s3_bucket.mybucket.id 
     key = "index.html"
     source = "index.html"
     acl = "public-read"
     content_type = "text/html"
}

resource "aws_s3_bucket_object" "error" {
     bucket = aws_s3_bucket.mybucket.id 
     key = "error.html"
     source = "error.html"
     acl = "public-read"
     content_type = "text/html"
}

#Hosting website on S3 
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.mybucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
  depends_on = [ aws_s3_bucket_acl.example ]
}
