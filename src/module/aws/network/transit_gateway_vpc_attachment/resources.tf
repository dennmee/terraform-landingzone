########################################################
# Transit Gateway Attachment
########################################################
resource "aws_ec2_transit_gateway_vpc_attachment" "this" {
  subnet_ids                                      = var.subnet_ids
  transit_gateway_id                              = var.transit_gateway_id
  vpc_id                                          = var.vpc_id
  dns_support                                     = local.dns_support
  transit_gateway_default_route_table_association = var.transit_gateway_default_route_table_association
  transit_gateway_default_route_table_propagation = var.transit_gateway_default_route_table_propagation

  tags = merge(
    var.common_tags,
    var.transit_gateway_vpc_attachment_tags,
    {
      "Name" = format(
        "%s-%s-%s",
        lower(var.transit_gateway_vpc_attachment_resource_prefix),
        join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name)),
        lower(var.environment_name),
      )
    },
  )
}
