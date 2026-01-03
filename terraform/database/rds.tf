resource "aws_db_subnet_group" "db_subnet" {
  name       = "${var.project_name}-db-subnet"
  subnet_ids = [
    var.subnet1,
    var.subnet2
  ]

  tags = {
    Name = "${var.project_name}-db-subnet"
  }
}

resource "aws_db_instance" "mysql" {
  identifier         = "ticketmaster-db"
  engine             = "mysql"
  engine_version     = "8.0"
  instance_class     = "db.t3.micro"
  allocated_storage  = 20
  username           = "admin"
  password           = "Akshay@123"

  db_subnet_group_name = aws_db_subnet_group.db_subnet.name
  publicly_accessible  = true
  skip_final_snapshot  = true
}
