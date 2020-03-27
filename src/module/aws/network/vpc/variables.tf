variable "cidr_block" {
  type        = string
  description = "The CIDR block for the VPC."
}

variable "enable_dns_support" {
  type        = bool
  description = "A boolean flag to enable/disable DNS support in the VPC."
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "A boolean flag to enable/disable DNS hostnames in the VPC."
}

variable "common_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to all resources."
}

variable "vpc_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to vpc resource."
}

variable "vpc_resource_prefix" {
  type        = string
  description = "The prefix name convention for vpc object."
}

variable "environment_name" {
  type        = string
  description = "The reference name of the current environment."
}

variable "enable_dhcp_options" {
  type        = string
  description = "The CIDR block for the VPC."
}

variable "dhcp_options_domain_name" {
  type        = string
  description = "The suffix domain name to use by default when resolving non Fully Qualified Domain Names. The search value in the /etc/resolv.conf file."
}

variable "dhcp_options_domain_name_servers" {
  type        = list(string)
  description = "List of name servers to configure in /etc/resolv.conf. If you want to use the default AWS nameservers you should set this to AmazonProvidedDNS."
}

variable "dhcp_options_ntp_servers" {
  type        = list(string)
  description = "List of NTP servers to configure."
}

variable "dhcp_options_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to dhcp option resource."
}

variable "dhcp_options_resource_prefix" {
  type        = string
  description = "The prefix name convention for dhcp options object."
}

variable "subnet_resource_prefix" {
  type        = string
  description = "The prefix name convention for subnet object."
}

variable "edge_subnets" {
  type        = list(string)
  description = "A list of VPC subnet IDs to create an edge subnet."
}

variable "edge_subnet_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to edge subnets."
}

variable "edge_subnet_tier_name" {
  type        = string
  description = "The tier name convention for edge subnet object."
}

variable "private_subnets" {
  type        = list(string)
  description = "A list of VPC subnet IDs to create a private subnet."
}

variable "private_subnet_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to private subnets."
}

variable "eks_cluster_resource_prefix" {
  type        = string
  description = "The prefix name convention for EKS Cluster object."
}

variable "eks_cluster_tier_name" {
  type        = string
  description = "The tier name convention for EKS Cluster object."
}

variable "private_subnet_tier_name" {
  type        = string
  description = "The tier name convention for private subnet object."
}

variable "data_subnets" {
  type        = list(string)
  description = "A list of VPC subnet IDs to create a data subnet."
}

variable "data_subnet_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to data subnets."
}

variable "data_subnet_tier_name" {
  type        = string
  description = "The tier name convention for data subnet object."
}

variable "db_subnet_group_resource_prefix" {
  type        = string
  description = "The prefix name convention for subnet group object."
}

variable "db_subnet_group_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to db subnet group."
}

variable "default_network_acl_ingress_rules" {
  type        = list(map(string))
  description = "List of maps of ingress rules to set on the default Network ACL"
}

variable "default_network_acl_egress_rules" {
  type        = list(map(string))
  description = "List of maps of egress rules to set on the default Network ACL"
}

variable "default_network_acl_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to default Network ACL."
}

variable "network_acl_resource_prefix" {
  type        = string
  description = "The prefix name convention for Network ACL object."
}

variable "default_network_acl_tier_name" {
  type        = string
  description = "The tier name convention for default Network ACL object."
}

variable "edge_network_acl_ingress_rules" {
  type        = list(map(string))
  description = "List of maps of ingress rules to set on the edge Network ACL"
}

variable "edge_network_acl_egress_rules" {
  type        = list(map(string))
  description = "List of maps of egress rules to set on the edge Network ACL"
}

variable "edge_network_acl_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to edge Network ACL."
}

variable "private_network_acl_ingress_rules" {
  type        = list(map(string))
  description = "List of maps of ingress rules to set on the private Network ACL"
}

variable "private_network_acl_egress_rules" {
  type        = list(map(string))
  description = "List of maps of egress rules to set on the private Network ACL"
}

variable "private_network_acl_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to private Network ACL."
}

variable "data_network_acl_ingress_rules" {
  type        = list(map(string))
  description = "List of maps of ingress rules to set on the data Network ACL"
}

variable "data_network_acl_egress_rules" {
  type        = list(map(string))
  description = "List of maps of egress rules to set on the data Network ACL"
}

variable "data_network_acl_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to data Network ACL."
}

variable "internet_gateway_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to Internet Gateway object."
}

variable "internet_gateway_resource_prefix" {
  type        = string
  description = "The prefix name convention for Internet Gateway object."
}

variable "eip_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to NAT Elastic IP object."
}

variable "nat_eip_resource_prefix" {
  type        = string
  description = "The prefix name convention for NAT Elastic IP object."
}

variable "nat_eip_tier_name" {
  type        = string
  description = "The tier name convention for NAT Elastic IP object."
}

variable "nat_gateway_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to NAT Gateway object."
}

variable "nat_gateway_resource_prefix" {
  type        = string
  description = "The prefix name convention for NAT Gateway object."
}

variable "route_table_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to Route Table object."
}

variable "route_table_resource_prefix" {
  type        = string
  description = "The prefix name convention for Route Table object."
}
