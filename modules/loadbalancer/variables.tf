variable "target_application_port" {
  type    = string
  default = "80"
}

variable "protocol" {
    type    = string
    default = "HTTP"  
}

variable "load-bal-type" {
    type    = string
    default = "application"
}

variable "target_group" {
    type    = string
    default = "target-group-alb"  
}

variable "load_balancer_name" {
    type = string
    default = "application-loadbalancer"  
}

variable "prod-sg-id" { 
}

variable "public_subnet1_id" {  
}

variable "public_subnet2_id" {  
}

variable "vpc-id"{
}

variable "public-1-id"{
}

variable "public-2-id"{
}