variable "db_name" {
  type    = string
  default = "wordpressdb"
}

variable "db_user" {
  type    = string
  default = "admin"
}

variable "db_password" {
  type    = string
  default = "Wordpress-AWS2Tier"
}

variable "rds_engine" {
    type    = string
    default = "mysql"  
}

variable "rds_ins_class" {
    type    = string
    default = "db.t3.micro"  
}

variable "availability_zone" {
  type    = list(string)
  default = ["ap-northeast-1a", "ap-northeast1b", "ap-northeast-1c"]
}

variable "private-subnet-1-id"{
}

variable "private-subnet-2-id"{
}

variable "db-sg-id"{
}