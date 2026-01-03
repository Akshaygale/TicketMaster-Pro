resource "aws_launch_template" "backend" {
  name_prefix   = "backend"
  image_id      = "ami-0a7cf821b91bcccbc"
  instance_type = "t2.micro"

  vpc_security_group_ids = [var.app_sg_id]
}
