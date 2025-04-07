# backend.tf
terraform {
  backend "s3" {
    bucket         = "new-state-bucket-102"
    key            = "network/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}

resource "aws_dynamodb_table" "state_lock" {
  name         = "new-terraform-lock-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
