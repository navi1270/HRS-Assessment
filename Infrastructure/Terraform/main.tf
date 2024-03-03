provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "terraform-state-bucket"
    key    = "microservices/terraform.tfstate"
    region = "us-east-1"
  }
}

module "vpc" {
  source = "./modules/vpc"
}

module "ecs_cluster" {
  source          = "./modules/ecs_cluster"
  vpc_id          = module.vpc.vpc_id
  availability_zones = var.availability_zones
}

module "ecs_services" {
  source       = "./modules/ecs_services"
  ecs_cluster_id = module.ecs_cluster.cluster_id
  services     = var.services
}

module "dns" {
  source = "./modules/dns"
  zone_name = var.dns_zone_name
  ecs_services = module.ecs_services.services
}

