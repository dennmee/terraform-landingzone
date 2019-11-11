module "organization" {
  source                        = "../../../module/aws/organizations/organization"
  aws_service_access_principals = local.organization-aws_service_access_principals
  enabled_policy_types          = local.organization-enabled_policy_types
  feature_set                   = local.organization-feature_set
}
