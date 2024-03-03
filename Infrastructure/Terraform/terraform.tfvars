aws_region      = "us-east-1"
availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]

services = [
  {
    name      = "microservice1"
    image     = "ecr_url/microservice1:latest"
    port      = 8080
    dns_alias = "microservice1.assessment.com"
  },
  {
    name      = "microservice2"
    image     = "ecre_url/microservice2:latest"
    port      = 8081
    dns_alias = "microservice2.assessment.com"
  }
]

dns_zone_name = "assessment.com"

