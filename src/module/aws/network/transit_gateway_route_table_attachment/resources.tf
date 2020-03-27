resource "aws_ec2_transit_gateway_route_table_association" "this" {
  count = length(var.route_table_associations)

  transit_gateway_attachment_id  = lookup(element(var.route_table_associations, count.index), "transit_gateway_attachment_id")
  transit_gateway_route_table_id = lookup(element(var.route_table_associations, count.index), "transit_gateway_route_table_id")
}

resource "aws_ec2_transit_gateway_route_table_propagation" "this" {
  count = length(var.route_table_propagations)

  transit_gateway_attachment_id  = lookup(element(var.route_table_propagations, count.index), "transit_gateway_attachment_id")
  transit_gateway_route_table_id = lookup(element(var.route_table_propagations, count.index), "transit_gateway_route_table_id")
}
