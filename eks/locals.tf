locals {
  account_id         = data.aws_caller_identity.current.account_id
  assume_role        = "arn:aws:iam::${local.account_id}:role/eks-system-role"
  vpc_id             = data.aws_vpc.k8s.id
  public_subnet_ids  = data.aws_subnet_ids.public.ids
  private_subnet_ids = data.aws_subnet_ids.private.ids
}