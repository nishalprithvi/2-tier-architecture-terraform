# here we create our ec2 and rds 

resource "aws_instance" "production_1_instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet1_id  #aws_subnet.ec2_1_public_subnet.id
  vpc_security_group_ids = [var.prod-sg-id  /*aws_security_group.production-instance-sg.id*/]
  key_name               = var.key_name
  user_data              = file("modules/ec2/install_script.sh")
  tags = {
    Name = "Production instance 1"
  }
  depends_on = [
    var.rds-db-id  /*aws_db_instance.rds_master*/,
  ]
}

resource "aws_instance" "production_2_instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet2_id  #aws_subnet.ec2_2_public_subnet.id
  vpc_security_group_ids = [var.prod-sg-id  /*aws_security_group.production-instance-sg.id*/]
  key_name               = var.key_name
  user_data              = file("modules/ec2/install_script.sh")
  tags = {
    Name = "Production instance 2"
  }
  depends_on = [
    var.rds-db-id /*aws_db_instance.rds_master*/,
  ]
}

