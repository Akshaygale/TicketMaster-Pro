resource "aws_ecr_repository" "frontend" {
  name = "${var.project-name}-frontend"
}

resource "aws_ecr_repository" "backend" {
  name = "${var.project-name}-backend"
}