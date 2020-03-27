resource "aws_ecr_repository" "this" {
  name = format(
    "%s-%s-%s-%s",
    lower(var.ecr_repository_resource_prefix),
    regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name),
    lower(var.environment_name),
    lower(var.ecr_repository_tier_name),
  )

  image_tag_mutability = var.image_tag_mutability

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }

  tags = merge(
    var.common_tags,
    var.ecr_repository_tags,
    {
      "Name" = format(
        "%s-%s-%s-%s",
        lower(var.ecr_repository_resource_prefix),
        regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name),
        lower(var.environment_name),
        lower(var.ecr_repository_tier_name),
      )
    },
  )
}
