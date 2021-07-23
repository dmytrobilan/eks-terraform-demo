data "aws_caller_identity" "current" {}

data "aws_vpc" "k8s" {
  tags = {
    "kubernetes.io/cluster/test" = "shared"
  }
}

data "aws_subnet_ids" "private" {
  vpc_id = local.vpc_id
  tags = {
    "kubernetes.io/role/internal-elb" = "1"
  }
}

data "aws_subnet_ids" "public" {
  vpc_id = local.vpc_id
  tags = {
    "kubernetes.io/role/elb" = "1"
  }
}