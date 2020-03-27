resource "local_file" "this" {
  filename = local.config_output_path

  content = templatefile(
    "${path.module}/templates/config.tpl",
    {
      eks_cluster_arn                       = var.eks_cluster_arn
      eks_cluster_auth_base64               = var.eks_cluster_auth_base64
      eks_cluster_endpoint                  = var.eks_cluster_endpoint
      aws_client_authentication_api_version = local.aws_client_authentication_api_version
      aws_authenticator_command             = local.aws_authenticator_command
      aws_region                            = data.aws_region.current.name
      eks_cluster_name = format(
        "%s-%s-%s-%s",
        lower(var.eks_cluster_resource_prefix),
        join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name)),
        lower(var.environment_name),
        lower(var.eks_cluster_tier_name),
      )
      aws_administrator_iam_role_arn = local.aws_administrator_iam_role_arn
    }
  )
}
