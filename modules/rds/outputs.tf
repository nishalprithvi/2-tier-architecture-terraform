output "rds_endpoint" {
  value = aws_db_instance.rds_master.endpoint
}

output "rds_username" {
  value = aws_db_instance.rds_master.username
}


output "rds_name" {
  value = aws_db_instance.rds_master.db_name
}

output "rds_master-id" {
  value = aws_db_instance.rds_master.id  
}