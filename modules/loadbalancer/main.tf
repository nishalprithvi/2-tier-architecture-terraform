# Creation of application LoadBalancer
resource "aws_lb" "application_loadbalancer" {
  name               = var.load_balancer_name
  internal           = false
  load_balancer_type = var.load-bal-type
  security_groups    = [var.prod-sg-id  /*aws_security_group.production-instance-sg.id*/]
  subnets            = [var.public_subnet2_id/*aws_subnet.ec2_2_public_subnet.id*/,var.public_subnet1_id/* aws_subnet.ec2_1_public_subnet.id*/]
}

# Target group for application loadbalancer
resource "aws_lb_target_group" "target_group_alb" {
  name     = var.target_group
  port     = var.target_application_port
  protocol = var.protocol
  vpc_id   = var.vpc-id #aws_vpc.infrastructure_vpc.id
}

# attach target group to an instance
resource "aws_lb_target_group_attachment" "attachment1" {
  target_group_arn = aws_lb_target_group.target_group_alb.arn
  target_id        = var.public-1-id  #aws_instance.production_1_instance.id
  port             = var.target_application_port
  depends_on = [
    var.public-1-id  /*aws_instance.production_1_instance*/,
  ]
}

# attach target group to an instance
resource "aws_lb_target_group_attachment" "attachment2" {
  target_group_arn = aws_lb_target_group.target_group_alb.arn
  target_id        = var.public-2-id #aws_instance.production_2_instance.id
  port             = var.target_application_port
  depends_on = [
    var.public-2-id  /*aws_instance.production_2_instance*/,
  ]
}

# attach target group to a loadbalancer
resource "aws_lb_listener" "external-elb" {
  load_balancer_arn = aws_lb.application_loadbalancer.arn
  port              = var.target_application_port
  protocol          = var.protocol
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group_alb.arn
  }
}