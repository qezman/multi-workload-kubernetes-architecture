variable "cluster_name" {
  type = string
}

variable "private_subnets" {
  type        = list(string)
  description = "The CIDR blocks for the private subnets"
}

variable "vpc_id" {
  type = string
}
