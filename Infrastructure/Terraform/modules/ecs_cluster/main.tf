resource "aws_ecs_cluster" "main" {
  name = "microservices-cluster"
}

output "cluster_id" {
  value = aws_ecs_cluster.main.id
}

