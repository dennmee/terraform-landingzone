########################################################
# Transit Gateway Route Table
########################################################
resource "aws_ec2_transit_gateway_route_table" "this" {
  transit_gateway_id = var.transit_gateway_id

  tags = merge(
    var.common_tags,
    var.transit_gateway_route_table_tags,
    {
      "Name" = format(
        "%s-%s-%s",
        lower(var.transit_gateway_route_table_resource_prefix),
        join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name)),
        lower(var.environment_name),
      )
    },
  )
}
