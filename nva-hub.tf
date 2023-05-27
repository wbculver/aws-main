
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

#esource "aws_panos_firewall" "main" {
#   name = "main-fw"
#   region = "us-east-1a"
#   ami_id = "ami.6njl1pau431dv1qxipg63mvah"
#   vpc_id = aws_vpc.main.id
#   instance_type = "m4.xlarge"
#   key_name = "pa-key"
#
#   network_interfaces = [
#     {
#       device_index = 0
#       subnet_id = aws_vpc.main.subnets[0].id
#     },
#     {
#       device_index = 1
#       subnet_id = aws_vpc.main.subnets[1].id
#     }
#   ]
#
#   route_tables = [
#     {
#       id = aws_vpc.main.route_tables[0].id
#     }
#   ]
#
#   tags = {
#     "Name" = "Main Palo Alto Firewall"
#   }
# }
