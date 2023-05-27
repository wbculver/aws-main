
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
resource "aws_subnet" "main-subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.5.0/24"
  depends_on = [aws_vpc.main]

  tags = {
    Name = "main-subnet"
  }
}
output "main-vpc-output" {
  value = aws_vpc.main.id
}
#