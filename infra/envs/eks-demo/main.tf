terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "terraform-eks-demo"
}

module "vpc" {
  source          = "../../modules/vpc"
  name            = "multi-workload-eks"
  private_subnets = var.private_subnets
  azs             = var.azs
}

module "eks" {
  source          = "../../modules/eks"
  cluster_name    = "multi-workerload-eks"
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets_ids
}
