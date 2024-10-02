data "aws_caller_identity" "this" {}

data "aws_iam_policy_document" "terraform_user_assume_role_policy" {
  statement {
    actions = [
      "sts:AssumeRole"
    ]
    resources = [
      aws_iam_role.terraform.arn
    ]
  }
}


data "aws_iam_policy_document" "terraform_role_assume_policy" {
  statement {
    actions = [
      "sts:AssumeRole",
      "sts:TagSession",
      "sts:SetSourceIdentity"
    ]
    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.this.account_id}:root"
      ]
    }
  }
}

data "aws_iam_policy_document" "terraform_role_policy" {
  statement {
    sid       = "S3FullAccess"
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "s3:*"
    ]
  }
}
