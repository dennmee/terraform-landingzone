variable "common_region" {
  type        = string
  description = "The Region ID where to create all resources."
}

variable "organizations_shared_account_id" {
  type        = string
  description = "The Organizations Account ID for the Shared account."
}

variable "organizations_dev_account_id" {
  type        = string
  description = "The Organizations Account ID for the Development account."
}

variable "organizations_stg_account_id" {
  type        = string
  description = "The Organizations Account ID for the Staging account."
}

variable "organizations_prod_account_id" {
  type        = string
  description = "The Organizations Account ID for the Production account."
}

variable "vpc_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to vpc resource."
}

variable "vpc_resource_prefix" {
  type        = string
  description = "The prefix name convention for vpc object."
}

variable "common_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to all resources."
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

variable "edge_subnet_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to edge subnets."
}

variable "edge_subnet_tier_name" {
  type        = string
  description = "The tier name convention for edge subnet object."
}

variable "private_subnet_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to private subnets."
}

variable "private_subnet_tier_name" {
  type        = string
  description = "The tier name convention for private subnet object."
}

variable "eks_cluster_resource_prefix" {
  type        = string
  description = "The prefix name convention for EKS Cluster object."
}

variable "eks_cluster_tier_name" {
  type        = string
  description = "The tier name convention for EKS Cluster object."
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

variable "edge_network_acl_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to edge Network ACL."
}

variable "private_network_acl_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to private Network ACL."
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

variable "transit_gateway_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to Transit Gateway object."
}

variable "transit_gateway_resource_prefix" {
  type        = string
  description = "The prefix name convention for Transit Gateway object."
}

variable "transit_gateway_vpc_attachment_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to Transit Gateway VPC Attachement object."
}

variable "transit_gateway_vpc_attachment_resource_prefix" {
  type        = string
  description = "The prefix name convention for Transit Gateway VPC Attachement object."
}

variable "transit_gateway_route_table_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to Transit Gateway Route Table object."
}

variable "transit_gateway_route_table_resource_prefix" {
  type        = string
  description = "The prefix name convention for Transit Gateway Route Table object."
}

variable "ram_resource_share_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to RAM Resource Share object."
}

variable "ram_resource_share_resource_prefix" {
  type        = string
  description = "The prefix name convention for RAM Resource Share object."
}

variable "shared_account_environment_name" {
  type        = string
  description = "The reference name of the Shared environment."
}

variable "shared_account_cidr_block" {
  type        = string
  description = "The CIDR block for the VPC."
}

variable "shared_account_enable_dns_support" {
  type        = bool
  description = "A boolean flag to enable/disable DNS support in the VPC."
}

variable "shared_account_enable_dns_hostnames" {
  type        = bool
  description = "A boolean flag to enable/disable DNS hostnames in the VPC."
}

variable "shared_account_enable_dhcp_options" {
  type        = string
  description = "The CIDR block for the VPC."
}

variable "shared_account_dhcp_options_domain_name" {
  type        = string
  description = "The suffix domain name to use by default when resolving non Fully Qualified Domain Names. The search value in the /etc/resolv.conf file."
}

variable "shared_account_dhcp_options_domain_name_servers" {
  type        = list(string)
  description = "List of name servers to configure in /etc/resolv.conf. If you want to use the default AWS nameservers you should set this to AmazonProvidedDNS."
}

variable "shared_account_dhcp_options_ntp_servers" {
  type        = list(string)
  description = "List of NTP servers to configure."
}

variable "shared_account_edge_subnets" {
  type        = list(string)
  description = "A list of VPC subnet IDs to create an edge subnet."
}

variable "shared_account_private_subnets" {
  type        = list(string)
  description = "A list of VPC subnet IDs to create a private subnet."
}

variable "shared_account_data_subnets" {
  type        = list(string)
  description = "A list of VPC subnet IDs to create a data subnet."
}

variable "shared_account_default_network_acl_ingress_rules" {
  type        = list(map(string))
  description = "List of maps of ingress rules to set on the default Network ACL"
}

variable "shared_account_default_network_acl_egress_rules" {
  type        = list(map(string))
  description = "List of maps of egress rules to set on the default Network ACL"
}

variable "shared_account_edge_network_acl_ingress_rules" {
  type        = list(map(string))
  description = "List of maps of ingress rules to set on the edge Network ACL"
}

variable "shared_account_edge_network_acl_egress_rules" {
  type        = list(map(string))
  description = "List of maps of egress rules to set on the edge Network ACL"
}

variable "shared_account_private_network_acl_ingress_rules" {
  type        = list(map(string))
  description = "List of maps of ingress rules to set on the private Network ACL"
}

variable "shared_account_private_network_acl_egress_rules" {
  type        = list(map(string))
  description = "List of maps of egress rules to set on the private Network ACL"
}

variable "shared_account_data_network_acl_ingress_rules" {
  type        = list(map(string))
  description = "List of maps of ingress rules to set on the data Network ACL"
}

variable "shared_account_data_network_acl_egress_rules" {
  type        = list(map(string))
  description = "List of maps of egress rules to set on the data Network ACL"
}

variable "dev_account_environment_name" {
  type        = string
  description = "The reference name of the Development environment."
}

variable "dev_account_cidr_block" {
  type        = string
  description = "The CIDR block for the VPC."
}

variable "dev_account_enable_dns_support" {
  type        = bool
  description = "A boolean flag to enable/disable DNS support in the VPC."
}

variable "dev_account_enable_dns_hostnames" {
  type        = bool
  description = "A boolean flag to enable/disable DNS hostnames in the VPC."
}

variable "dev_account_enable_dhcp_options" {
  type        = string
  description = "The CIDR block for the VPC."
}

variable "dev_account_dhcp_options_domain_name" {
  type        = string
  description = "The suffix domain name to use by default when resolving non Fully Qualified Domain Names. The search value in the /etc/resolv.conf file."
}

variable "dev_account_dhcp_options_domain_name_servers" {
  type        = list(string)
  description = "List of name servers to configure in /etc/resolv.conf. If you want to use the default AWS nameservers you should set this to AmazonProvidedDNS."
}

variable "dev_account_dhcp_options_ntp_servers" {
  type        = list(string)
  description = "List of NTP servers to configure."
}

variable "dev_account_edge_subnets" {
  type        = list(string)
  description = "A list of VPC subnet IDs to create an edge subnet."
}

variable "dev_account_private_subnets" {
  type        = list(string)
  description = "A list of VPC subnet IDs to create a private subnet."
}

variable "dev_account_data_subnets" {
  type        = list(string)
  description = "A list of VPC subnet IDs to create a data subnet."
}

variable "dev_account_default_network_acl_ingress_rules" {
  type        = list(map(string))
  description = "List of maps of ingress rules to set on the default Network ACL"
}

variable "dev_account_default_network_acl_egress_rules" {
  type        = list(map(string))
  description = "List of maps of egress rules to set on the default Network ACL"
}

variable "dev_account_edge_network_acl_ingress_rules" {
  type        = list(map(string))
  description = "List of maps of ingress rules to set on the edge Network ACL"
}

variable "dev_account_edge_network_acl_egress_rules" {
  type        = list(map(string))
  description = "List of maps of egress rules to set on the edge Network ACL"
}

variable "dev_account_private_network_acl_ingress_rules" {
  type        = list(map(string))
  description = "List of maps of ingress rules to set on the private Network ACL"
}

variable "dev_account_private_network_acl_egress_rules" {
  type        = list(map(string))
  description = "List of maps of egress rules to set on the private Network ACL"
}

variable "dev_account_data_network_acl_ingress_rules" {
  type        = list(map(string))
  description = "List of maps of ingress rules to set on the data Network ACL"
}

variable "dev_account_data_network_acl_egress_rules" {
  type        = list(map(string))
  description = "List of maps of egress rules to set on the data Network ACL"
}

variable "stg_account_environment_name" {
  type        = string
  description = "The reference name of the Staging environment."
}

variable "stg_account_cidr_block" {
  type        = string
  description = "The CIDR block for the VPC."
}

variable "stg_account_enable_dns_support" {
  type        = bool
  description = "A boolean flag to enable/disable DNS support in the VPC."
}

variable "stg_account_enable_dns_hostnames" {
  type        = bool
  description = "A boolean flag to enable/disable DNS hostnames in the VPC."
}

variable "stg_account_enable_dhcp_options" {
  type        = string
  description = "The CIDR block for the VPC."
}

variable "stg_account_dhcp_options_domain_name" {
  type        = string
  description = "The suffix domain name to use by default when resolving non Fully Qualified Domain Names. The search value in the /etc/resolv.conf file."
}

variable "stg_account_dhcp_options_domain_name_servers" {
  type        = list(string)
  description = "List of name servers to configure in /etc/resolv.conf. If you want to use the default AWS nameservers you should set this to AmazonProvidedDNS."
}

variable "stg_account_dhcp_options_ntp_servers" {
  type        = list(string)
  description = "List of NTP servers to configure."
}

variable "stg_account_edge_subnets" {
  type        = list(string)
  description = "A list of VPC subnet IDs to create an edge subnet."
}

variable "stg_account_private_subnets" {
  type        = list(string)
  description = "A list of VPC subnet IDs to create a private subnet."
}

variable "stg_account_data_subnets" {
  type        = list(string)
  description = "A list of VPC subnet IDs to create a data subnet."
}

variable "stg_account_default_network_acl_ingress_rules" {
  type        = list(map(string))
  description = "List of maps of ingress rules to set on the default Network ACL"
}

variable "stg_account_default_network_acl_egress_rules" {
  type        = list(map(string))
  description = "List of maps of egress rules to set on the default Network ACL"
}

variable "stg_account_edge_network_acl_ingress_rules" {
  type        = list(map(string))
  description = "List of maps of ingress rules to set on the edge Network ACL"
}

variable "stg_account_edge_network_acl_egress_rules" {
  type        = list(map(string))
  description = "List of maps of egress rules to set on the edge Network ACL"
}

variable "stg_account_private_network_acl_ingress_rules" {
  type        = list(map(string))
  description = "List of maps of ingress rules to set on the private Network ACL"
}

variable "stg_account_private_network_acl_egress_rules" {
  type        = list(map(string))
  description = "List of maps of egress rules to set on the private Network ACL"
}

variable "stg_account_data_network_acl_ingress_rules" {
  type        = list(map(string))
  description = "List of maps of ingress rules to set on the data Network ACL"
}

variable "stg_account_data_network_acl_egress_rules" {
  type        = list(map(string))
  description = "List of maps of egress rules to set on the data Network ACL"
}

variable "prod_account_environment_name" {
  type        = string
  description = "The reference name of the Production environment."
}

variable "prod_account_cidr_block" {
  type        = string
  description = "The CIDR block for the VPC."
}

variable "prod_account_enable_dns_support" {
  type        = bool
  description = "A boolean flag to enable/disable DNS support in the VPC."
}

variable "prod_account_enable_dns_hostnames" {
  type        = bool
  description = "A boolean flag to enable/disable DNS hostnames in the VPC."
}

variable "prod_account_enable_dhcp_options" {
  type        = string
  description = "The CIDR block for the VPC."
}

variable "prod_account_dhcp_options_domain_name" {
  type        = string
  description = "The suffix domain name to use by default when resolving non Fully Qualified Domain Names. The search value in the /etc/resolv.conf file."
}

variable "prod_account_dhcp_options_domain_name_servers" {
  type        = list(string)
  description = "List of name servers to configure in /etc/resolv.conf. If you want to use the default AWS nameservers you should set this to AmazonProvidedDNS."
}

variable "prod_account_dhcp_options_ntp_servers" {
  type        = list(string)
  description = "List of NTP servers to configure."
}

variable "prod_account_edge_subnets" {
  type        = list(string)
  description = "A list of VPC subnet IDs to create an edge subnet."
}

variable "prod_account_private_subnets" {
  type        = list(string)
  description = "A list of VPC subnet IDs to create a private subnet."
}

variable "prod_account_data_subnets" {
  type        = list(string)
  description = "A list of VPC subnet IDs to create a data subnet."
}

variable "prod_account_default_network_acl_ingress_rules" {
  type        = list(map(string))
  description = "List of maps of ingress rules to set on the default Network ACL"
}

variable "prod_account_default_network_acl_egress_rules" {
  type        = list(map(string))
  description = "List of maps of egress rules to set on the default Network ACL"
}

variable "prod_account_edge_network_acl_ingress_rules" {
  type        = list(map(string))
  description = "List of maps of ingress rules to set on the edge Network ACL"
}

variable "prod_account_edge_network_acl_egress_rules" {
  type        = list(map(string))
  description = "List of maps of egress rules to set on the edge Network ACL"
}

variable "prod_account_private_network_acl_ingress_rules" {
  type        = list(map(string))
  description = "List of maps of ingress rules to set on the private Network ACL"
}

variable "prod_account_private_network_acl_egress_rules" {
  type        = list(map(string))
  description = "List of maps of egress rules to set on the private Network ACL"
}

variable "prod_account_data_network_acl_ingress_rules" {
  type        = list(map(string))
  description = "List of maps of ingress rules to set on the data Network ACL"
}

variable "prod_account_data_network_acl_egress_rules" {
  type        = list(map(string))
  description = "List of maps of egress rules to set on the data Network ACL"
}

variable "shared_account_share_transit_gateway" {
  type        = bool
  description = "A boolean flag to enable/disable Transit Gateway resource sharing."
}
