resource "aws_autoscaling_group" "frontend_asg" {
  desired_capacity = 2
  max_size         = 4
  min_size         = 1
  vpc_zone_identifier = [var.public_subnet]

  launch_template {
    id      = aws_launch_template.frontend.id
    version = "$Latest"
  }
}
