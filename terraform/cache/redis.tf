resource "aws_elasticache_subnet_group" "redis_subnet" {
  name = "${var.project-name}"
  subnet_ids = [ var.subnet ]
}

resource "aws_elasticache_cluster" "redis" {
  cluster_id = "ticketmaster-redis"
  engine = "redis"
  node_type = "cache.t3.micro"
  num_cache_nodes = 1
  parameter_group_name = "default.redis7"

  subnet_group_name = aws_elasticache_subnet_group.redis_subnet.name
}