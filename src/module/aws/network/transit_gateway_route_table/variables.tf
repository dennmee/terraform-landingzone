variable "transit_gateway_id" {
  type        = string
  description = "Identifier of EC2 Transit Gateway to be attached."
}

variable "common_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to all resources."
}

variable "transit_gateway_route_table_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to Transit Gateway Route Table object."
}

variable "transit_gateway_route_table_resource_prefix" {
  type        = string
  description = "The prefix name convention for Transit Gateway Route Table object."
}

variable "environment_name" {
  type        = string
  description = "The reference name of the current environment."
}
