########################################################
# Transit Gateway
########################################################
resource "aws_ec2_transit_gateway" "this" {
  auto_accept_shared_attachments  = local.transit_gateway_auto_accept_shared_attachments
  default_route_table_association = local.default_route_table_association
  default_route_table_propagation = local.default_route_table_propagation
  description                     = local.transit_gateway_description
  dns_support                     = local.dns_support
  vpn_ecmp_support                = local.vpn_ecmp_support

  tags = merge(
    var.common_tags,
    var.transit_gateway_tags,
    {
      "Name" = format(
        "%s-%s-%s",
        lower(var.transit_gateway_resource_prefix),
        join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name)),
        lower(var.environment_name),
      )
    },
  )
}

########################################################
# Resource Access Manager (RAM) Resource Share
# Used to share Transit Gateway across accounts
########################################################
resource "aws_ram_resource_share" "this" {
  count = var.share_transit_gateway ? 1 : 0

  name = format(
    "%s-%s-%s-%s",
    lower(var.ram_resource_share_resource_prefix),
    join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name)),
    lower(var.environment_name),
    lower(var.transit_gateway_resource_prefix),
  )

  allow_external_principals = local.allow_external_principals

  tags = merge(
    var.common_tags,
    var.ram_resource_share_tags,
    {
      "Name" = format(
        "%s-%s-%s-%s",
        lower(var.ram_resource_share_resource_prefix),
        join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name)),
        lower(var.environment_name),
        lower(var.transit_gateway_resource_prefix),
      )
    },
  )
}

resource "aws_ram_resource_association" "this" {
  count = var.share_transit_gateway ? 1 : 0

  resource_arn       = aws_ec2_transit_gateway.this.arn
  resource_share_arn = aws_ram_resource_share.this[0].arn
}

resource "aws_ram_principal_association" "this" {
  count = var.share_transit_gateway ? 1 : 0

  principal          = local.principal
  resource_share_arn = aws_ram_resource_share.this[0].arn
}
