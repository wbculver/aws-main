#############################################################################################################################
# notes
##############################################################################################################################




#############################################################################################################################
# Create Tgw, VPC attachment
##############################################################################################################################

# create tgw in AWS Network Account 
resource "aws_ec2_transit_gateway" "test-tgw" {
 
  description                     = "Transit Gateway testing scenario with 2 VPCs, subnets each"
  default_route_table_association = "enable"
  default_route_table_propagation = "enable"
  tags = {
    Name        = "test-tgw"
    environment = "prd"
  }
}


## Attachement of VPC1 from AWS production Account

#resource "aws_ec2_transit_gateway_vpc_attachment" "vpc1-attachment" {
# 
#  subnet_ids         = [aws_subnet.public_subnet1.id]
#  transit_gateway_id = aws_ec2_transit_gateway.test-tgw.id
#  vpc_id             = aws_vpc.vpc1.id
#  tags = {
#    "Name" = "transit-gateway-attachment1"
#  }
#}
#
### Attachement of VPC2 from AWS production Account
#resource "aws_ec2_transit_gateway_vpc_attachment" "vpc2-attachment" {
# 
#  subnet_ids         = [aws_subnet.public_subnet2.id]
#  transit_gateway_id = aws_ec2_transit_gateway.test-tgw.id
#  vpc_id             = aws_vpc.vpc2.id
#  tags = {
#    "Name" = "transit-gateway-attachment2"
#  }
#}


