variable "route_table_associations" {
  type        = list(map(string))
  description = "List of maps of Transit Gateway Attachment and Route Table to associate. Map keys are: transit_gateway_attachment_id and transit_gateway_route_table_id"
}

variable "route_table_propagations" {
  type        = list(map(string))
  description = "List of maps of Transit Gateway Attachment and Route Table to propagate. Map keys are: transit_gateway_attachment_id and transit_gateway_route_table_id"
}
