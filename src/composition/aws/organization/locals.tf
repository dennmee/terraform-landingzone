locals {
  organization-aws_service_access_principals = [
    "iam.amazonaws.com",
    "events.amazonaws.com",
    "cloudtrail.amazonaws.com",
    "config.amazonaws.com",
  ]
  organization-enabled_policy_types = ["SERVICE_CONTROL_POLICY", "TAG_POLICY"]
  organization-feature_set          = "ALL"
}
