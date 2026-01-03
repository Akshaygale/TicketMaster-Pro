output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnets" {
  value = aws_subnet.public[*].id   # list of all public subnets
}

# Optional: first public subnet
output "public_subnet_id" {
  value = aws_subnet.public[0].id   # first public subnet
}
