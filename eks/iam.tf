module "test_service_account_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version = "4.2.0"
  create_role = true
  role_name = "s3-dev-role"
  oidc_fully_qualified_subjects = ["system:serviceaccount:default:s3-dev-service-account"]
  provider_url = module.eks.cluster_oidc_issuer_url
  role_policy_arns = [
    aws_iam_policy.s3_access.arn,
  ]
  number_of_role_policy_arns = 1
}

resource "aws_iam_policy" "s3_access" {
  name        = "test-service-account-policy"
  description = "A policy for test service account"
  policy      = data.aws_iam_policy_document.s3_access.json
}

data "aws_iam_policy_document" "s3_access" {
  statement {
    sid = "S3List"
    actions = [
      "s3:ListBucket"
    ]
    resources = [
      "arn:aws:s3:::bucket-qwerty-abc"
    ]
  }

  statement {
    sid = "S3Access"
    actions = [
      "s3:PutObject",
      "s3:GetObject",
      "s3:DeleteObject"
    ]
    resources = [
      "arn:aws:s3:::bucket-qwerty-abc/*"
    ]
  }
}