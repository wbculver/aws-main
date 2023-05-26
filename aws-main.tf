

provider "aws" {
  shared_credentials_files = ["~/.aws/credentials"]
  region = "us-east-1"
}

resource "aws_s3_bucket" "a2023-tf-bc-my-terraform-state-buckett" {
  bucket = "a2023-tf-bc-my-terraform-state-buckett"  
}

resource "aws_dynamodb_table" "my_terraform_state_lock_table" {
  name = "my_terraform_state_lock_table"
  hash_key = "id"
  range_key = "version"
  read_capacity = 1
  write_capacity = 1

  billing_mode = "PROVISIONED"

  attribute {
    name = "id"
    type = "N"
  }

  attribute {
    name = "version"
    type = "N"
  }
}


resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
   tags = {
    Name = "main-vpc"
  }
}

output "main-vpc-output" {
  value = aws_vpc.main.id
}