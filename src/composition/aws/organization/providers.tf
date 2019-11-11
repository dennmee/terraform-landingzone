provider "aws" {
  version = "~> 2.0"
  region  = var.region
  # assume_role = {
  #   role_arn = "arn:aws:iam::${data.terraform_remote_state.organization.master_account_id}:role/${local.assume_role_name
  # }
}
