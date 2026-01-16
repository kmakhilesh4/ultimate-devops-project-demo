provider "aws" {
  region = "ap-south-1"
}


resource "aws_s3_bucket" "s3Bucket" {
  bucket = "terraform-eks-state-bucket-akm"

  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_dynamodb_table" "dynamodb-table" {
  name           = "terraform-eks-state-locks"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockId"

  attribute {
    name = "LockId"
    type = "S"
  }

}