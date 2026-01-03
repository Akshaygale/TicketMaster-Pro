resource "aws_db_subnet_group" "db_sunbet" {
  name = "${var.project-name}-db-subnet"
  subnet_ids = [var.subnet]
}

resource "aws_db_instance" "mysql" {
  identifier = "ticketmaster-db"
  engine = "mysql"
  engine_version = "8.0"
  instance_class = "db.t3.micro"
  allocated_storage = 20

  username = "admin"
  password = "Akshay@123"

  db_subnet_group_name = aws_db_subnet_group.db_sunbet.name
  publicly_accessible = true
  skip_final_snapshot = true
}