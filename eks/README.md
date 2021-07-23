# eks-terraform-demo


## Requirements

| Name | Version |
|------|---------|
| terraform | 1.0.3 |
| aws | ~> 3.2.0 |
| kuberntes |    |



## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| asg_desired_capacity | The desired size of the autoscaling group. | `number` | - | yes |
| cluster_version | Desired Kubernetes master version. | `string` | - | yes |
| instance_type | The instance type for EKS Node Group. | `string` |  | yes |
| region | The region that all AWS resources are deployed to. | `string` | us-east-2 | no |

## Outputs

| Name | Description |
|------|-------------|
| cluster_name | The name of the EKS cluster |
| sa_role_arn | The role arn for S3 ServiceAccount |
| region | AWS region |