module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "test-cluster"
  cluster_version = var.cluster_version
  subnets         = local.private_subnet_ids
  vpc_id          = local.vpc_id

  workers_group_defaults = {
    root_volume_type = "gp2"
  }
  worker_groups = [
    {
      instance_type        = var.instance_type
      asg_desired_capacity = var.asg_desired_capacity
    }
  ]

}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}