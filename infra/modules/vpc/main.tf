module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = var.name
  cidr = var.cidr

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets


  enable_nat_gateway = true # private subnet nodes need outbound internet
  single_nat_gateway = true # 1 NAT instead of 1-per-AZ, cheaper}

  public_subnet_tags = {
    "kubernetes.io/role/elb" = "1" # required: tells AWS LB controller which subnets are public-facing
  }
  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = "1"
  }
}
