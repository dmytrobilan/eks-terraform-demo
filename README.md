# eks-terraform-demo

## Task

Terraform code that deploys an EKS cluster (whatever latest version is currently available) into an existing VPC

The terraform code should also prepare anything needed for a pod to be able to assume an IAM role

Include a short readme that explains how to use the Terraform repo and that also demonstrates how an end-user (a developer from the company) can run a pod on this new EKS cluster and also have an IAM role assigned that allows that pod to access an S3 bucket.


## Prerequisites

 - AWS VPC created(Exampled one in folder VPC)
 - VPC and Subnets Tagged
    For VPC
    ```    
        "kubernetes.io/cluster/test" = "shared"
    ```
    For subnets private
    ```
        "kubernetes.io/role/internal-elb" = "1"
    ```
    For public:
    ```
        "kubernetes.io/role/elb" = "1"

    ```
- Permissions to access TF and kubernetes



### Create cluster

- Make sure that you have proper permission to AWS EKS
- Terraform 1.0.3 required 

Replace bucket name in policies in file iam.tf


Init configuration

```
terraform init
```

Create cluster 

```
terraform apply -auto-approve
```

Get credentials

```
aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)
```

Note: Config file will be also created in root dir, you can copypaste it to ~/.kube/config


### IAM roles for service accounts

One time action required after cluster created
[Details](https://docs.aws.amazon.com/eks/latest/userguide/enable-iam-roles-for-service-accounts.html)

```
eksctl utils associate-iam-oidc-provider --cluster $(terraform output -raw cluster_name) --approve
```

### Example usage

 
Examples can be found under ```test-k8s``` directory

NOTE: only s3-dev-service-account in default namespace can assume role

Create test pod

```
kubectl apply -f sa.yaml
kubectl apply -f test-pod.yaml
```

Exec into pod
```
kubectl exec -it example -- sh
```

Run example or any other commands:

```
aws s3 ls s3://your_bucket
```