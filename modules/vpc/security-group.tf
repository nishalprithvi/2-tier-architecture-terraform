# Create a security  group for production node to allow traffic 
resource "aws_security_group" "production-instance-sg" {
  name        = var.prod-ins-sg-name
  description = "Security from who allow inbound traffic on port 22 and 9090"
  vpc_id      = aws_vpc.infrastructure_vpc.id

  # dynamic block who create two rules to allow inbound traffic 
  dynamic "ingress" {
    for_each = var.inbound_port_production_ec2
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = var.protocol
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create a security  group for database to allow traffic on port 3306 and from ec2 production security group
resource "aws_security_group" "database-sg" {
  name        = var.db-sg-name
  description = "security  group for database to allow traffic on port 3306 and from ec2 production security group"
  vpc_id      = aws_vpc.infrastructure_vpc.id

  ingress {
    description     = "Allow traffic from port 3306 and from ec2 production security group"
    from_port       = var.traffic-port
    to_port         = var.traffic-port
    protocol        = var.protocol
    security_groups = [aws_security_group.production-instance-sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}