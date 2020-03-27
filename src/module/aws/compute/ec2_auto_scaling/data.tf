data "aws_region" "current" {}

data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_kms_key" "ebs_aws" {
  key_id = "alias/aws/ebs"
}
