########################################################
# Cloudwatch Log Group
########################################################
resource "aws_cloudwatch_log_group" "this" {
  name = format(
    "%s-%s-%s-%s",
    lower(var.cloudwatch_log_group_resource_prefix),
    regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name),
    lower(var.environment_name),
    lower(var.cloudwatch_log_group_tier_name),
  )

  retention_in_days = var.cloudwatch_log_group_retention_in_days
  kms_key_id        = var.cloudwatch_log_group_kms_key_id != "" ? var.cloudwatch_log_group_kms_key_id : null

  tags = merge(
    var.common_tags,
    var.cloudwatch_log_group_tags,
    {
      "Name" = format(
        "%s-%s-%s-%s",
        lower(var.cloudwatch_log_group_resource_prefix),
        regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name),
        lower(var.environment_name),
        lower(var.cloudwatch_log_group_tier_name),
      )
    },
  )
}
