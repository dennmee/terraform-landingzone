variable "environment_name" {
  type        = string
  description = "The reference name of the current environment."
}

variable "ram_principal_association" {
  type        = string
  description = "The principal that can be associated with a resource share. Possible values are an AWS account ID, an AWS Organizations Organization ARN, or an AWS Organizations Organization Unit ARN."
}

variable "common_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to all resources."
}

variable "transit_gateway_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to Transit Gateway object."
}

variable "transit_gateway_resource_prefix" {
  type        = string
  description = "The prefix name convention for Transit Gateway object."
}

variable "share_transit_gateway" {
  type        = bool
  description = "A boolean flag to enable/disable Transit Gateway shared resource."
}

variable "ram_resource_share_resource_prefix" {
  type        = string
  description = "The prefix name convention for RAM Resource Share object."
}

variable "ram_resource_share_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to RAM Resource Share object."
}
