variable "ecs_cluster_id" {}

variable "services" {}

resource "aws_ecs_task_definition" "service" {
  count          = length(var.services)
  family         = var.services[count.index].name
  container_definitions = jsonencode([
    {
      "name"            : var.services[count.index].name,
      "image"           : var.services[count.index].image,
      "cpu"             : 256,
      "memory"          : 512,
      "essential"       : true,
      "portMappings"    : [
        {
          "containerPort" : var.services[count.index].port
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "service" {
  count                = length(var.services)
  name                 = var.services[count.index].name
  cluster              = var.ecs_cluster_id
  task_definition      = aws_ecs_task_definition.service[count.index].arn
  desired_count        = 1
  launch_type          = "FARGATE"
  network_configuration {
    subnets          = module.vpc.private_subnets
    security_groups  = [aws_security_group.default.id]
  }
  depends_on = [aws_ecs_task_definition.service]
}

output "services" {
  value = aws_ecs_service.service[*].name
}

