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
  source = "../../modules/vpc"
  name   = "multi-workerload-eks"
}
