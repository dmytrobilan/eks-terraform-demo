variable "region" {
  default     = "us-east-2"
  type        = string
  description = "The region that all AWS resources are deployed to."
}

variable "instance_type" {
  type        = string
  description = "The instance type associated with the EKS Node Group."
}

variable "asg_desired_capacity" {
  type        = number
  description = "The maximum size of the autoscale group."
}

variable "cluster_version" {
  type        = string
  description = "Desired Kubernetes master version."
}