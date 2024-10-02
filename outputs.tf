output "iam_user_arn" {
  value = aws_iam_user.terraform.arn
}

output "iam_role_arn" {
  value = aws_iam_role.terraform.arn
}