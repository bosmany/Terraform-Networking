# backend.tf
terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket"
    key            = "network/terraform.tfstate"
    region         = var.aws_region
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}

resource "aws_dynamodb_table" "state_lock" {
  name         = "terraform-lock-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
