#############################################################################################################################
# notes
##############################################################################################################################




#############################################################################################################################
# Create Tgw, VPC attachment
##############################################################################################################################

# create tgw in AWS Network Account 
resource "aws_ec2_transit_gateway" "tgw" {
 
  description                     = "Transit Gateway testing scenario with 2 VPCs, subnets each"
  default_route_table_association = "enable"
  default_route_table_propagation = "enable"
  tags = {
    Name        = "test-tgw"
    environment = "prd"
  }
}
resource "aws_vpc" "aws_transit_vpc" {
  cidr_block = "10.192.0.0/16"
   tags = {
    Name = "aws_transit_vpc"
  }
}

output "aws_transit_vpc_out" {
  value = aws_vpc.aws_transit_vpc.id
}
resource "aws_subnet" "tgw_subnet" {
  vpc_id     = aws_vpc.aws_transit_vpc.id  
  cidr_block = "10.192.1.0/24"       # Replace with your desired CIDR block for the subnet
  availability_zone = "us-east-1a" # Replace with your desired availability zone

  tags = {
    Name = "tgwSubnet"              # Replace with your desired name for the subnet
  }
}

## Attachement of VPC1 from AWS production Account

resource "aws_ec2_transit_gateway_vpc_attachment" "vpc1-attachment" {
 
  subnet_ids         = [aws_subnet.tgw_subnet.id]
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id             = aws_vpc.aws_transit_vpc.id 
  tags = {
    "Name" = "transit-gateway-attachment1"
  }
}

output "aws_transitgw_out" {
  value = aws_ec2_transit_gateway.tgw.id
}

resource "aws_ec2_transit_gateway_vpc_attachment" "vpc2-attachment" {
 
  subnet_ids         = [aws_subnet.main-subnet.id]
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id             = aws_vpc.main.id
  tags = {
    "Name" = "transit-gateway-attachment-main"
  }
}
