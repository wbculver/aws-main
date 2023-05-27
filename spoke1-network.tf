
resource "aws_vpc" "spoke1" {
  cidr_block = "10.194.0.0/16"
   tags = {
    Name = "spoke1-vpc"
  }
}

resource "aws_subnet" "spoke1-subnet" {
  vpc_id     = aws_vpc.spoke1.id
  cidr_block = "10.194.0.0/24"
  depends_on = [aws_vpc.spoke1]

  tags = {
    Name = "spoke1-subnet"
  }
}
resource "aws_vpc_peering_connection" "peering" {
  vpc_id        = aws_vpc.spoke1.id
  peer_vpc_id   = "vpc-083d5d03cd96da809"
  auto_accept   = true
}