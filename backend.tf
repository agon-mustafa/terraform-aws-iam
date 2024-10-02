terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "IAC-Terraform-AM"

    workspaces {
      prefix = "bootstrap-terraforma-"
    }
  }
}