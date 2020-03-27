locals {
  name = format(
    "%s-%s-%s-%s",
    lower(var.sns_topic_resource_prefix),
    regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name),
    lower(var.environment_name),
    lower(var.sns_topic_tier_name),
  )

  tags = merge(
    var.common_tags,
    var.sns_topic_tags,
    {
      "Name" = format(
        "%s-%s-%s-%s",
        lower(var.sns_topic_resource_prefix),
        regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name),
        lower(var.environment_name),
        lower(var.sns_topic_tier_name),
      )
    },
  )

}
