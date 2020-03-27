provider "aws" {
  version = "~> 2.0"
  region  = var.common_region
}

provider "aws" {
  alias   = "shared"
  version = "~> 2.0"
  region  = var.common_region
  assume_role {
    role_arn = format(
      "%s%s%s%s",
      "arn:aws:iam::",
      var.organizations_shared_account_id,
      ":role/",
      local.terraform_assume_role_name,
    )
  }
}

provider "aws" {
  alias   = "dev"
  version = "~> 2.0"
  region  = var.common_region
  assume_role {
    role_arn = format(
      "%s%s%s%s",
      "arn:aws:iam::",
      var.organizations_dev_account_id,
      ":role/",
      local.terraform_assume_role_name,
    )
  }
}

provider "aws" {
  alias   = "stg"
  version = "~> 2.0"
  region  = var.common_region
  assume_role {
    role_arn = format(
      "%s%s%s%s",
      "arn:aws:iam::",
      var.organizations_stg_account_id,
      ":role/",
      local.terraform_assume_role_name,
    )
  }
}

provider "aws" {
  alias   = "prod"
  version = "~> 2.0"
  region  = var.common_region
  assume_role {
    role_arn = format(
      "%s%s%s%s",
      "arn:aws:iam::",
      var.organizations_prod_account_id,
      ":role/",
      local.terraform_assume_role_name,
    )
  }
}
