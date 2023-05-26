
# Configuration section for internet gateway
resource "aws_internet_gateway" "internet_gateway1" {
  vpc_id = aws_vpc.main.id

  tags ={
    Name = "IGW1"
  }
}

# Subnet1
resource "aws_subnet" "public_subnet1" {
 
  cidr_block        = "10.0.192.0/24"
  vpc_id            = aws_vpc.main.id
    tags = {
    Name = "public-subnet-1"
}
}

# Configuration section for route table public subnet
resource "aws_route_table" "public_subnet1" {
  vpc_id = aws_vpc.main.id
  tags = {
    "Name" = "public-rt1"
  }

} 

# Create route table public subnet association
#resource "aws_route_table_association" "public_subnet_association1" {
#  subnet_id      = aws_subnet.public_subnet1.id
#  route_table_id = aws_route_table.public_subnet1.id
#}#
