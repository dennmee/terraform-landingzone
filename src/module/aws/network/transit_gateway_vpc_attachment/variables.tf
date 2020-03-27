variable "subnet_ids" {
  type        = list(string)
  description = "A list of VPC subnet IDs to attach to transit gateway."
}

variable "transit_gateway_id" {
  type        = string
  description = "Identifier of EC2 Transit Gateway."
}

variable "vpc_id" {
  type        = string
  description = "A VPC ID to attach to transit gateway."
}

variable "transit_gateway_default_route_table_association" {
  type        = bool
  description = "Boolean whether the VPC Attachment should be associated with the EC2 Transit Gateway association default route table. This cannot be configured or perform drift detection with Resource Access Manager shared EC2 Transit Gateways."
}

variable "transit_gateway_default_route_table_propagation" {
  type        = bool
  description = "Boolean whether the VPC Attachment should propagate routes with the EC2 Transit Gateway propagation default route table. This cannot be configured or perform drift detection with Resource Access Manager shared EC2 Transit Gateways."
}

variable "common_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to all resources."
}

variable "transit_gateway_vpc_attachment_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to Transit Gateway VPC Attachement object."
}

variable "transit_gateway_vpc_attachment_resource_prefix" {
  type        = string
  description = "The prefix name convention for Transit Gateway VPC Attachement object."
}

variable "environment_name" {
  type        = string
  description = "The reference name of the current environment."
}
