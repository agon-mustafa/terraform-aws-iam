variable "environment" {
  type        = string
  description = "The name of the Environment. Supported values are: dev, qa, prod"
}

variable "aws_access_key" {
  type        = string
  description = "AWS Access Key Id"
}

variable "aws_secret_key" {
  type        = string
  description = "AWS Secret Key"
}