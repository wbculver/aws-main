
provider "aws" {
  shared_credentials_files = ["~/.aws/credentials"]
  region = "us-east-1"
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
#