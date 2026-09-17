variable "name" {
  description = "Name of vpc for tagging"
  type        = string
}

variable "cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "azs" {
  description = "AZs to deploy the VPC"
  type        = list(string)
}

variable "private_subnets" {
  type        = list(string)
  description = "The CIDR blocks for the private subnets"
}

variable "public_subnets" {
  type    = list(string)
  default = ["10.0.101.0/24", "10.0.102.0/24"]
}
