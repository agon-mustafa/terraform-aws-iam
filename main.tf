locals {
  default_tags = {
    Environment = var.environment
  }
}

resource "aws_iam_user" "terraform" {
  name          = "terraform-user-${var.environment}"
  path          = "/tools/"
  force_destroy = true
  tags          = local.default_tags
}

resource "aws_iam_policy" "terraform_user_assume_role_policy" {

  name        = "terraform-user-assume-role-policy-${var.environment}"
  description = "IAM policy to grant permission terraform-user"
  path        = "/"
  policy      = data.aws_iam_policy_document.terraform_user_assume_role_policy.json
}

resource "aws_iam_user_policy_attachment" "default_user_assume_role_policy" {
  user       = aws_iam_user.terraform.name
  policy_arn = aws_iam_policy.terraform_user_assume_role_policy.arn
  depends_on = [
    aws_iam_user.terraform
  ]
}


resource "aws_iam_role" "terraform" {
  name               = "terraform-role-${var.environment}"
  assume_role_policy = data.aws_iam_policy_document.terraform_role_assume_policy.json

  managed_policy_arns = [
    aws_iam_policy.terraform_role_policy.arn
  ]
  tags = local.default_tags # Tags associated with the IAM policy
}


resource "aws_iam_policy" "terraform_role_policy" {

  name        = "terraform-role-access-policy"
  description = "IAM policy granting access to terraform-role"
  path        = "/"
  policy      = data.aws_iam_policy_document.terraform_role_policy.json

  tags = local.default_tags
}
