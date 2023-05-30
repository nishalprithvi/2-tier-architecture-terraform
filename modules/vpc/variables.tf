variable "cidr_block" {
    type = string
    default = "0.0.0.0/0"  
}

variable "vpc_cidr" {
    type = string
    description = "vpc_cidr range for the vpc"
    default = "10.0.0.0/16" 
}

variable "vpc-tag" {
    type = string
    description = "tag for vpc (name tag)"
    default = "2-tier-architecture-vpc"
}

variable "igw-tag" {
    type = string
    description = "tag for internet gateway (name tag)"
    default = "2-tier-architecture-igw"
}

variable "ec2-2-subnet-tag" {
    type = string
    description = "tag for ec2 subnet (name tag)"
    default = "second ec2 public subnet"
}

variable "ec2-1-subnet-tag" {
    type = string
    description = "tag for ec2 subnet (name tag)"
    default = "first ec2 public subnet"
}

variable "private-1-subnet-tag" {
    type = string
    description = "tag for priavte subnet (name tag)"
    default = "database private subnet"
}

variable "priavte-2-subnet-tag" {
    type = string
    description = "tag for private subnet (name tag)"
    default = "database read replica private subnet"
}

variable "subnet_cidrs" {
  type        = list(string)
  description = "list of all cidr for subnet"
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]   # each subnet have a range of 2^8 ip addresses
}

variable "availability_zone" {
  type    = list(string)
  default = ["ap-northeast-1a", "ap-northeast1b", "ap-northeast-1c"]
}

variable "protocol" {
    type    = string
    default = "tcp"  
}

variable "prod-ins-sg-name" {
    type    = string
    default = "production-instance-sg"  
}

variable "db-sg-name" {
    type    = string
    default = "database-sg"  
}

variable "traffic-port" {
    type    = string
    default = "3306" 
}

variable "inbound_port_production_ec2" {
  type        = list(any)
  default     = [22, 80]
  description = "inbound port allow on production instance"
}