provider "aws" {
  region     = "ap-south-1"
 
}

resource "aws_s3_bucket" "aws_infra_backend_state" {

  bucket = "aws-infra-terraform-backend-state"

  lifecycle {
    prevent_destroy = false
  }
  force_destroy = true
  versioning {
    enabled = true
  }


  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }


}

resource "aws_dynamodb_table" "AWS_infra_state_lock" {

  name         = "aws_infra_state_locks"
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}