terraform {
  backend "s3" {
    bucket         = "a2023-tf-bc-my-terraform-state-buckett"
    region         = "us-east-1"
    key            = "terraform.tfstate"
    dynamodb_table = "my-terraform-state-lock-table"
  }
}