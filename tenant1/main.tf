data "aws_availability_zones" "available" {}

# Create a AWS VPC which contains the following:
#   - VPC
#   - Public subnet(s)
#   - Private subnet(s)
#   - Internet Gateway
#   - Routing table

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.18.1"

  name = "${var.name} vpc"
  cidr = var.platform_cidr

  azs             = data.aws_availability_zones.available.names
  private_subnets = var.private_cidrs
  public_subnets  = var.public_cidrs

  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = true

  enable_dns_hostnames = false

  tags = var.tags

  vpc_tags = {
    "Type" = "VPC"
  }

  public_subnet_tags = {
    "Type"        = "Subnet"
    "Subnet type" = "Public"
  }

  private_subnet_tags = {
    "Type"        = "Subnet"
    "Subnet type" = "Private"
  }
}
