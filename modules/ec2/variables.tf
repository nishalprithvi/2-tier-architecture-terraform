variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ami" {
  type    = string
  default = "ami-03dceaabddff8067e" # ami for amazon linux ec2 (ap-northeast-1 region)
}

variable "key_name" {
  type    = string
  default = "terraform-key" # key pair
}

variable "availability_zone" {
  type    = list(string)
  default = ["ap-northeast-1a", "ap-northeast1b", "ap-northeast-1c"]
}

variable "public_subnet1_id" {  
}

variable "public_subnet2_id" {  
}

variable "prod-sg-id" {  
}

variable "rds-db-id" {  
}