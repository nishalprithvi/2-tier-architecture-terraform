resource "aws_route_table" "infrastructure_route_table" {
  vpc_id = aws_vpc.infrastructure_vpc.id

  route {
    //associated subnet can reach everywhere
    cidr_block = var.cidr_block
    //CRT uses this IGW to reach internet
    gateway_id = aws_internet_gateway.tier_architecture_igw.id
  }

}

# by attaching public subnet with internet gateway and providing route in route table we make public subnet accessible to the internet

# attach ec2 1 subnet to an internet gateway
resource "aws_route_table_association" "route-ec2-1-subnet-to-igw" {
  subnet_id      = aws_subnet.ec2_1_public_subnet.id
  route_table_id = aws_route_table.infrastructure_route_table.id
}

# attach ec2 2 subnet to an internet gateway
resource "aws_route_table_association" "route-ec2-2-subnet-to-igw" {
  subnet_id      = aws_subnet.ec2_2_public_subnet.id
  route_table_id = aws_route_table.infrastructure_route_table.id
}