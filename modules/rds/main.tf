resource "aws_db_subnet_group" "database_subnet" {
  name       = "db subnet"
  subnet_ids = [var.private-subnet-1-id /*aws_subnet.database_private_subnet.id*/, var.private-subnet-2-id /*aws_subnet.database_read_replica_private_subnet.id*/]
}

resource "aws_db_instance" "rds_master" {
  identifier              = "master-rds-instance"
  allocated_storage       = 10
  engine                  = var.rds_engine
  engine_version          = "5.7.37"
  instance_class          = var.rds_ins_class
  db_name                 = var.db_name
  username                = var.db_user
  password                = var.db_password
  backup_retention_period = 7
  multi_az                = false
  availability_zone       = var.availability_zone[1]
  db_subnet_group_name    = aws_db_subnet_group.database_subnet.id
  skip_final_snapshot     = true
  vpc_security_group_ids  = [var.db-sg-id /*aws_security_group.database-sg.id*/]
  storage_encrypted       = true

  tags = {
    Name = "my-rds-master"
  }
}

resource "aws_db_instance" "rds_replica" {
  replicate_source_db    = aws_db_instance.rds_master.identifier
  instance_class         = "db.t3.micro"
  identifier             = "replica-rds-instance"
  allocated_storage      = 10
  skip_final_snapshot    = true
  multi_az               = false
  availability_zone      = var.availability_zone[0]
  vpc_security_group_ids = [var.db-sg-id /*aws_security_group.database-sg.id*/]
  storage_encrypted      = true

  tags = {
    Name = "my-rds-replica"
  }

}