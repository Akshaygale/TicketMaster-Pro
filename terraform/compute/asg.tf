resource "aws_autoscaling_group" "frontend_asg" {
  desired_capacity    = 2
  max_size            = 4
  min_size            = 1
  vpc_zone_identifier = [var.public_subnet]
  target_group_arns   = [var.frontend_lt_id]
  launch_template {
    id      = aws_launch_template.frontend.id
    version = "$Latest"
  }
}

resource "aws_autoscaling_group" "backend_asg" {
  desired_capacity    = 2
  max_size            = 4
  min_size            = 1
  vpc_zone_identifier = [var.public_subnet]
  target_group_arns   = [var.backend_lt_id]
  launch_template {
    id      = aws_launch_template.backend.id
    version = "$Latest"
  }
}
