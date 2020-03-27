resource "aws_ec2_transit_gateway_route" "this" {
  count = length(var.transit_gateway_routes)

  destination_cidr_block         = lookup(element(var.transit_gateway_routes, count.index), "destination_cidr_block")
  transit_gateway_attachment_id  = lookup(element(var.transit_gateway_routes, count.index), "transit_gateway_attachment_id")
  transit_gateway_route_table_id = lookup(element(var.transit_gateway_routes, count.index), "transit_gateway_route_table_id")
}
