resource "aws_launch_template" "backend" {
  name_prefix   = "backend-"
  image_id      = "ami-0a7cf821b91bcccbc"
  instance_type = "t3.micro"
  vpc_security_group_ids = [var.app_sg_id]
  user_data = file("../scripts/install_docker.sh")
}
