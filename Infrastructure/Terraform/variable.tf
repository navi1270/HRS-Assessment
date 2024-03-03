variable "aws_region" {
  default     = "us-east-1"
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "services" {
  description = "List of microservices to deploy"
  type        = list(object({
    name        = string
    image       = string
    port        = number
    dns_alias   = string
  }))
}

variable "dns_zone_name" {
  description = "DNS zone name"
  type        = string
}

