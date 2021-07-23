output "cluster_name" {
  value       = module.eks.cluster_id
  description = "The anme of the EKS cluster created for this environment."
}

output "region" {
  value       = var.region
  description = "The anme of the EKS cluster created for this environment."
}

output "sa_role_arn" {
  value       = module.test_service_account_role.iam_role_arn
  description = "The role arn of test ServiceAccount."
}