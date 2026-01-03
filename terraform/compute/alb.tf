resource "aws_lb" "alb" {
  name               = "ticketmaster-alb"
  load_balancer_type = "application"

  subnets         = [var.public_subnet]
  security_groups = [var.alb_sg_id]
}
