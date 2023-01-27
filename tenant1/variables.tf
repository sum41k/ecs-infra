variable "region" {
  default = "us-east-1"
}

variable "name" {
  default = "service1"
}

variable "environment" {
  default = "test"
}

variable "enable_nat_gateway" {
  description = "Enable nat gateway deployment.Required for adding working nodes to cluster"
  type        = bool
  default     = false
}

variable "platform_cidr" {
  description = "The CIDR block for the VPC to create for deployment, e.g 10.0.0.0/16"
  default     = "10.200.0.0/16" #10.200.0.0/16
}


variable "public_cidrs" {
  description = "The list of CIDR blocks to create public subnets"
  default = [
    "10.200.1.0/24",
    "10.200.2.0/24"

  ]
}

variable "private_cidrs" {
  description = "The list of CIDR blocks to create private subnets"
  default = [
    "10.200.3.0/24",
    "10.200.4.0/24"
  ]
}

variable "tags" {
  description = "A map of tags to apply to all resources"
  default = {
    "Environment" = "Development"
  }
}
