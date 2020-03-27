variable "transit_gateway_routes" {
  type        = list(map(string))
  description = "List of maps of Route entries to create. Map keys are: destination_cidr_block, transit_gateway_attachment_id and transit_gateway_route_table_id"
}
