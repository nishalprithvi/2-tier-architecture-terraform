# this tf file is for creating voc resource

resource "aws_vpc" "infrastructure_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = "true" #gives you an internal domain name
  enable_dns_hostnames = "true" #gives you an internal host name
  instance_tenancy     = "default"

  tags = {
    Name = var.vpc-tag
  }
}

# It enables our vpc to connect to the internet
resource "aws_internet_gateway" "tier_architecture_igw" {   # internet gateway for public subnet to access internet
  vpc_id = aws_vpc.infrastructure_vpc.id
  tags = {
    Name = var.igw-tag
  }
}

# first ec2 instance public subnet
resource "aws_subnet" "ec2_1_public_subnet" {
  vpc_id                  = aws_vpc.infrastructure_vpc.id
  cidr_block              = var.subnet_cidrs[1]
  map_public_ip_on_launch = "true" //it makes this a public subnet
  availability_zone       = var.availability_zone[0]
  tags = {
    Name = var.ec2-1-subnet-tag
  }
}

# second ec2 instance public subnet
resource "aws_subnet" "ec2_2_public_subnet" {
  vpc_id                  = aws_vpc.infrastructure_vpc.id
  cidr_block              = var.subnet_cidrs[2]
  map_public_ip_on_launch = "true" //it makes this a public subnet
  availability_zone       = var.availability_zone[1]
  tags = {
    Name = var.ec2-2-subnet-tag
  }
}

# database private subnet
resource "aws_subnet" "database_private_subnet" {
  vpc_id                  = aws_vpc.infrastructure_vpc.id
  cidr_block              = var.subnet_cidrs[4]
  map_public_ip_on_launch = "false" //it makes this a private subnet
  availability_zone       = var.availability_zone[1]
  tags = {
    Name = var.private-1-subnet-tag
  }
}

# database read replica private subnet
resource "aws_subnet" "database_read_replica_private_subnet" {
  vpc_id                  = aws_vpc.infrastructure_vpc.id
  cidr_block              = var.subnet_cidrs[3]
  map_public_ip_on_launch = "false"
  availability_zone       = var.availability_zone[0]
  tags = {
    Name = var.priavte-2-subnet-tag
  }
}