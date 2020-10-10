terraform {
  required_version = ">= 0.13"
  backend "remote" {}
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.10.0"
    }
  }
}
