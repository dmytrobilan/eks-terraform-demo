locals {
  vpc_id             = data.aws_vpc.k8s.id
  public_subnet_ids  = data.aws_subnet_ids.public.ids
  private_subnet_ids = data.aws_subnet_ids.private.ids
}