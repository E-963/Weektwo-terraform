resource "aws_s3_bucket" "s3-1" {
  bucket = "sky-s3-main28"

  tags = { 
    Environment    = "terraformChamps"
    Owner          = "Sama"
  }

  force_destroy       = true    # force destroy even if the bucket not empty
}

resource "aws_s3_bucket_ownership_controls" "controls" {
  bucket = aws_s3_bucket.s3-1.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

 # Enable bucket versioning
resource "aws_s3_bucket_versioning" "ver-s3-1" {
  bucket = aws_s3_bucket.s3-1.id
  versioning_configuration {
    status = "Enabled"
  }
}

 # Configure objects encryption as "SSE-S3"
resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.s3-1.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm      = "AES256"
    }
    
      bucket_key_enabled = true         # Enable Bucket key.
  }
}

 # Configure life cycle expiration object at 7 days
resource "aws_s3_bucket_lifecycle_configuration" "bucket-Configure" {
  bucket = aws_s3_bucket.s3-1.id

  rule {
    id = "expiration object at 7 days"

     expiration {
      days = 7
    }
    status = "Enabled"
  }
}
