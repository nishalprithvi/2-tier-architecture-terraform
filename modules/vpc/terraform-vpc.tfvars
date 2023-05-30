# for vpc
vpc_cidr = "10.0.0.0/16"
subnet_cidrs = [ "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24" ]
availability_zone = [ "ap-northeast-1a", "ap-northeast1b", "ap-northeast-1c" ]

vpc-tag = "2-tier-architecture-vpc"
igw-tag = "2-tier-architecture-igw"
ec2-1-subnet-tag = "first ec2 public subnet"
ec2-2-subnet-tag = "second ec2 public subnet"
priavte-1-subnet-tag = "database private subnet"
private-2-subnet-tag = "database read replica private subnet"

# for security group 
protocol         = "tcp"
prod-ins-sg-name = "production-instance-sg"
db-sg-name       = "database-sg"
traffic-port     = "3306"