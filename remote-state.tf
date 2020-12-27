terraform {

  backend "s3" {
    bucket         = "aws-infra-terraform-backend-state"
    key            = "awsinfrastate"
    dynamodb_table = "aws_infra_state_locks"
    region         = "ap-south-1"
    encrypt        = "true"
  }
}