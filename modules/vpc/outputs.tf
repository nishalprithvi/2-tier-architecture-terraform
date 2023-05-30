output "public_subnet1_id" {
  value = aws_subnet.ec2_1_public_subnet.id
}

output "public_subnet2_id" {
    value = aws_subnet.ec2_2_public_subnet.id  
}

output "production-instance-sg-id" {
    value = aws_security_group.production-instance-sg.id  
}

output "vpc-id" {
    value =  aws_vpc.infrastructure_vpc.id  
}

output "private_subnet1_id" {
    value = aws_subnet.database_private_subnet.id  
}

output "private_subnet2_id" {
    value = aws_subnet.database_read_replica_private_subnet.id  
}

output "database-sg-id" {
    value = aws_security_group.database-sg.id  
}