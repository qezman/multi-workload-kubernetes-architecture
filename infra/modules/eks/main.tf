module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  # 1. Cluster Identity
  cluster_name    = var.cluster_name
  cluster_version = "1.31"

  # 2. Networking
  vpc_id     = var.vpc_id
  subnet_ids = var.private_subnets # nodes + control plane ENIs go here

  # 3. Access & Security
  cluster_endpoint_public_access  = true # lets local kubectl reach it
  cluster_endpoint_private_access = false

  # 4. Compute / Worker Nodes
  eks_managed_node_groups = {
    default = {
      instance_types = ["t3.small"]
      min_size       = 2
      max_size       = 2
      desired_size   = 2
    }
  }
}
