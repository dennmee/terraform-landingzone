module "shared_account_vpc" {
  source = "../../../modules/aws/network/vpc"

  cidr_block                        = var.shared_account_cidr_block
  enable_dns_support                = var.shared_account_enable_dns_support
  enable_dns_hostnames              = var.shared_account_enable_dns_hostnames
  common_tags                       = var.common_tags
  vpc_tags                          = var.vpc_tags
  vpc_resource_prefix               = var.vpc_resource_prefix
  environment_name                  = var.shared_account_environment_name
  enable_dhcp_options               = var.shared_account_enable_dhcp_options
  dhcp_options_domain_name          = var.shared_account_dhcp_options_domain_name
  dhcp_options_domain_name_servers  = var.shared_account_dhcp_options_domain_name_servers
  dhcp_options_ntp_servers          = var.shared_account_dhcp_options_ntp_servers
  dhcp_options_tags                 = var.dhcp_options_tags
  dhcp_options_resource_prefix      = var.dhcp_options_resource_prefix
  subnet_resource_prefix            = var.subnet_resource_prefix
  edge_subnets                      = var.shared_account_edge_subnets
  edge_subnet_tags                  = var.edge_subnet_tags
  edge_subnet_tier_name             = var.edge_subnet_tier_name
  private_subnets                   = var.shared_account_private_subnets
  private_subnet_tags               = var.private_subnet_tags
  private_subnet_tier_name          = var.private_subnet_tier_name
  eks_cluster_resource_prefix       = var.eks_cluster_resource_prefix
  eks_cluster_tier_name             = var.eks_cluster_tier_name
  data_subnets                      = var.shared_account_data_subnets
  data_subnet_tags                  = var.data_subnet_tags
  data_subnet_tier_name             = var.data_subnet_tier_name
  db_subnet_group_resource_prefix   = var.db_subnet_group_resource_prefix
  db_subnet_group_tags              = var.db_subnet_group_tags
  default_network_acl_ingress_rules = var.shared_account_default_network_acl_ingress_rules
  default_network_acl_egress_rules  = var.shared_account_default_network_acl_egress_rules
  default_network_acl_tags          = var.default_network_acl_tags
  network_acl_resource_prefix       = var.network_acl_resource_prefix
  default_network_acl_tier_name     = var.default_network_acl_tier_name
  edge_network_acl_ingress_rules    = var.shared_account_edge_network_acl_ingress_rules
  edge_network_acl_egress_rules     = var.shared_account_edge_network_acl_egress_rules
  edge_network_acl_tags             = var.edge_network_acl_tags
  private_network_acl_ingress_rules = var.shared_account_private_network_acl_ingress_rules
  private_network_acl_egress_rules  = var.shared_account_private_network_acl_egress_rules
  private_network_acl_tags          = var.private_network_acl_tags
  data_network_acl_ingress_rules    = var.shared_account_data_network_acl_ingress_rules
  data_network_acl_egress_rules     = var.shared_account_data_network_acl_egress_rules
  data_network_acl_tags             = var.data_network_acl_tags
  internet_gateway_tags             = var.internet_gateway_tags
  internet_gateway_resource_prefix  = var.internet_gateway_resource_prefix
  eip_tags                          = var.eip_tags
  nat_eip_resource_prefix           = var.nat_eip_resource_prefix
  nat_eip_tier_name                 = var.nat_eip_tier_name
  nat_gateway_tags                  = var.nat_gateway_tags
  nat_gateway_resource_prefix       = var.nat_gateway_resource_prefix
  route_table_tags                  = var.route_table_tags
  route_table_resource_prefix       = var.route_table_resource_prefix

  providers = {
    aws = aws.shared
  }
}

module "dev_account_vpc" {
  source = "../../../modules/aws/network/vpc"

  cidr_block                        = var.dev_account_cidr_block
  enable_dns_support                = var.dev_account_enable_dns_support
  enable_dns_hostnames              = var.dev_account_enable_dns_hostnames
  common_tags                       = var.common_tags
  vpc_tags                          = var.vpc_tags
  vpc_resource_prefix               = var.vpc_resource_prefix
  environment_name                  = var.dev_account_environment_name
  enable_dhcp_options               = var.dev_account_enable_dhcp_options
  dhcp_options_domain_name          = var.dev_account_dhcp_options_domain_name
  dhcp_options_domain_name_servers  = var.dev_account_dhcp_options_domain_name_servers
  dhcp_options_ntp_servers          = var.dev_account_dhcp_options_ntp_servers
  dhcp_options_tags                 = var.dhcp_options_tags
  dhcp_options_resource_prefix      = var.dhcp_options_resource_prefix
  subnet_resource_prefix            = var.subnet_resource_prefix
  edge_subnets                      = var.dev_account_edge_subnets
  edge_subnet_tags                  = var.edge_subnet_tags
  edge_subnet_tier_name             = var.edge_subnet_tier_name
  private_subnets                   = var.dev_account_private_subnets
  private_subnet_tags               = var.private_subnet_tags
  private_subnet_tier_name          = var.private_subnet_tier_name
  eks_cluster_resource_prefix       = var.eks_cluster_resource_prefix
  eks_cluster_tier_name             = var.eks_cluster_tier_name
  data_subnets                      = var.dev_account_data_subnets
  data_subnet_tags                  = var.data_subnet_tags
  data_subnet_tier_name             = var.data_subnet_tier_name
  db_subnet_group_resource_prefix   = var.db_subnet_group_resource_prefix
  db_subnet_group_tags              = var.db_subnet_group_tags
  default_network_acl_ingress_rules = var.dev_account_default_network_acl_ingress_rules
  default_network_acl_egress_rules  = var.dev_account_default_network_acl_egress_rules
  default_network_acl_tags          = var.default_network_acl_tags
  network_acl_resource_prefix       = var.network_acl_resource_prefix
  default_network_acl_tier_name     = var.default_network_acl_tier_name
  edge_network_acl_ingress_rules    = var.dev_account_edge_network_acl_ingress_rules
  edge_network_acl_egress_rules     = var.dev_account_edge_network_acl_egress_rules
  edge_network_acl_tags             = var.edge_network_acl_tags
  private_network_acl_ingress_rules = var.dev_account_private_network_acl_ingress_rules
  private_network_acl_egress_rules  = var.dev_account_private_network_acl_egress_rules
  private_network_acl_tags          = var.private_network_acl_tags
  data_network_acl_ingress_rules    = var.dev_account_data_network_acl_ingress_rules
  data_network_acl_egress_rules     = var.dev_account_data_network_acl_egress_rules
  data_network_acl_tags             = var.data_network_acl_tags
  internet_gateway_tags             = var.internet_gateway_tags
  internet_gateway_resource_prefix  = var.internet_gateway_resource_prefix
  eip_tags                          = var.eip_tags
  nat_eip_resource_prefix           = var.nat_eip_resource_prefix
  nat_eip_tier_name                 = var.nat_eip_tier_name
  nat_gateway_tags                  = var.nat_gateway_tags
  nat_gateway_resource_prefix       = var.nat_gateway_resource_prefix
  route_table_tags                  = var.route_table_tags
  route_table_resource_prefix       = var.route_table_resource_prefix

  providers = {
    aws = aws.dev
  }
}

module "stg_account_vpc" {
  source = "../../../modules/aws/network/vpc"

  cidr_block                        = var.stg_account_cidr_block
  enable_dns_support                = var.stg_account_enable_dns_support
  enable_dns_hostnames              = var.stg_account_enable_dns_hostnames
  common_tags                       = var.common_tags
  vpc_tags                          = var.vpc_tags
  vpc_resource_prefix               = var.vpc_resource_prefix
  environment_name                  = var.stg_account_environment_name
  enable_dhcp_options               = var.stg_account_enable_dhcp_options
  dhcp_options_domain_name          = var.stg_account_dhcp_options_domain_name
  dhcp_options_domain_name_servers  = var.stg_account_dhcp_options_domain_name_servers
  dhcp_options_ntp_servers          = var.stg_account_dhcp_options_ntp_servers
  dhcp_options_tags                 = var.dhcp_options_tags
  dhcp_options_resource_prefix      = var.dhcp_options_resource_prefix
  subnet_resource_prefix            = var.subnet_resource_prefix
  edge_subnets                      = var.stg_account_edge_subnets
  edge_subnet_tags                  = var.edge_subnet_tags
  edge_subnet_tier_name             = var.edge_subnet_tier_name
  private_subnets                   = var.stg_account_private_subnets
  private_subnet_tags               = var.private_subnet_tags
  private_subnet_tier_name          = var.private_subnet_tier_name
  eks_cluster_resource_prefix       = var.eks_cluster_resource_prefix
  eks_cluster_tier_name             = var.eks_cluster_tier_name
  data_subnets                      = var.stg_account_data_subnets
  data_subnet_tags                  = var.data_subnet_tags
  data_subnet_tier_name             = var.data_subnet_tier_name
  db_subnet_group_resource_prefix   = var.db_subnet_group_resource_prefix
  db_subnet_group_tags              = var.db_subnet_group_tags
  default_network_acl_ingress_rules = var.stg_account_default_network_acl_ingress_rules
  default_network_acl_egress_rules  = var.stg_account_default_network_acl_egress_rules
  default_network_acl_tags          = var.default_network_acl_tags
  network_acl_resource_prefix       = var.network_acl_resource_prefix
  default_network_acl_tier_name     = var.default_network_acl_tier_name
  edge_network_acl_ingress_rules    = var.stg_account_edge_network_acl_ingress_rules
  edge_network_acl_egress_rules     = var.stg_account_edge_network_acl_egress_rules
  edge_network_acl_tags             = var.edge_network_acl_tags
  private_network_acl_ingress_rules = var.stg_account_private_network_acl_ingress_rules
  private_network_acl_egress_rules  = var.stg_account_private_network_acl_egress_rules
  private_network_acl_tags          = var.private_network_acl_tags
  data_network_acl_ingress_rules    = var.stg_account_data_network_acl_ingress_rules
  data_network_acl_egress_rules     = var.stg_account_data_network_acl_egress_rules
  data_network_acl_tags             = var.data_network_acl_tags
  internet_gateway_tags             = var.internet_gateway_tags
  internet_gateway_resource_prefix  = var.internet_gateway_resource_prefix
  eip_tags                          = var.eip_tags
  nat_eip_resource_prefix           = var.nat_eip_resource_prefix
  nat_eip_tier_name                 = var.nat_eip_tier_name
  nat_gateway_tags                  = var.nat_gateway_tags
  nat_gateway_resource_prefix       = var.nat_gateway_resource_prefix
  route_table_tags                  = var.route_table_tags
  route_table_resource_prefix       = var.route_table_resource_prefix

  providers = {
    aws = aws.stg
  }
}

module "prod_account_vpc" {
  source = "../../../modules/aws/network/vpc"

  cidr_block                        = var.prod_account_cidr_block
  enable_dns_support                = var.prod_account_enable_dns_support
  enable_dns_hostnames              = var.prod_account_enable_dns_hostnames
  common_tags                       = var.common_tags
  vpc_tags                          = var.vpc_tags
  vpc_resource_prefix               = var.vpc_resource_prefix
  environment_name                  = var.prod_account_environment_name
  enable_dhcp_options               = var.prod_account_enable_dhcp_options
  dhcp_options_domain_name          = var.prod_account_dhcp_options_domain_name
  dhcp_options_domain_name_servers  = var.prod_account_dhcp_options_domain_name_servers
  dhcp_options_ntp_servers          = var.prod_account_dhcp_options_ntp_servers
  dhcp_options_tags                 = var.dhcp_options_tags
  dhcp_options_resource_prefix      = var.dhcp_options_resource_prefix
  subnet_resource_prefix            = var.subnet_resource_prefix
  edge_subnets                      = var.prod_account_edge_subnets
  edge_subnet_tags                  = var.edge_subnet_tags
  edge_subnet_tier_name             = var.edge_subnet_tier_name
  private_subnets                   = var.prod_account_private_subnets
  private_subnet_tags               = var.private_subnet_tags
  private_subnet_tier_name          = var.private_subnet_tier_name
  eks_cluster_resource_prefix       = var.eks_cluster_resource_prefix
  eks_cluster_tier_name             = var.eks_cluster_tier_name
  data_subnets                      = var.prod_account_data_subnets
  data_subnet_tags                  = var.data_subnet_tags
  data_subnet_tier_name             = var.data_subnet_tier_name
  db_subnet_group_resource_prefix   = var.db_subnet_group_resource_prefix
  db_subnet_group_tags              = var.db_subnet_group_tags
  default_network_acl_ingress_rules = var.prod_account_default_network_acl_ingress_rules
  default_network_acl_egress_rules  = var.prod_account_default_network_acl_egress_rules
  default_network_acl_tags          = var.default_network_acl_tags
  network_acl_resource_prefix       = var.network_acl_resource_prefix
  default_network_acl_tier_name     = var.default_network_acl_tier_name
  edge_network_acl_ingress_rules    = var.prod_account_edge_network_acl_ingress_rules
  edge_network_acl_egress_rules     = var.prod_account_edge_network_acl_egress_rules
  edge_network_acl_tags             = var.edge_network_acl_tags
  private_network_acl_ingress_rules = var.prod_account_private_network_acl_ingress_rules
  private_network_acl_egress_rules  = var.prod_account_private_network_acl_egress_rules
  private_network_acl_tags          = var.private_network_acl_tags
  data_network_acl_ingress_rules    = var.prod_account_data_network_acl_ingress_rules
  data_network_acl_egress_rules     = var.prod_account_data_network_acl_egress_rules
  data_network_acl_tags             = var.data_network_acl_tags
  internet_gateway_tags             = var.internet_gateway_tags
  internet_gateway_resource_prefix  = var.internet_gateway_resource_prefix
  eip_tags                          = var.eip_tags
  nat_eip_resource_prefix           = var.nat_eip_resource_prefix
  nat_eip_tier_name                 = var.nat_eip_tier_name
  nat_gateway_tags                  = var.nat_gateway_tags
  nat_gateway_resource_prefix       = var.nat_gateway_resource_prefix
  route_table_tags                  = var.route_table_tags
  route_table_resource_prefix       = var.route_table_resource_prefix

  providers = {
    aws = aws.prod
  }
}

module "shared_account_transit_gateway" {
  source = "../../../modules/aws/network/transit_gateway"

  environment_name                   = var.shared_account_environment_name
  ram_principal_association          = data.aws_organizations_organization.current.arn
  common_tags                        = var.common_tags
  transit_gateway_tags               = var.transit_gateway_tags
  transit_gateway_resource_prefix    = var.transit_gateway_resource_prefix
  share_transit_gateway              = var.shared_account_share_transit_gateway
  ram_resource_share_resource_prefix = var.ram_resource_share_resource_prefix
  ram_resource_share_tags            = var.ram_resource_share_tags

  providers = {
    aws = aws.shared
  }
}

module "shared_account_transit_gateway_vpc_attachment" {
  source = "../../../modules/aws/network/transit_gateway_vpc_attachment"

  subnet_ids                                      = module.shared_account_vpc.private_subnet_ids
  transit_gateway_id                              = module.shared_account_transit_gateway.id
  vpc_id                                          = module.shared_account_vpc.vpc_id
  transit_gateway_default_route_table_association = module.shared_account_transit_gateway.default_route_table_association
  transit_gateway_default_route_table_propagation = module.shared_account_transit_gateway.default_route_table_propagation
  common_tags                                     = var.common_tags
  transit_gateway_vpc_attachment_tags             = var.transit_gateway_vpc_attachment_tags
  transit_gateway_vpc_attachment_resource_prefix  = var.transit_gateway_vpc_attachment_resource_prefix
  environment_name                                = var.shared_account_environment_name

  providers = {
    aws = aws.shared
  }
}

module "dev_account_transit_gateway_vpc_attachment" {
  source = "../../../modules/aws/network/transit_gateway_vpc_attachment"

  subnet_ids                                      = module.dev_account_vpc.private_subnet_ids
  transit_gateway_id                              = module.shared_account_transit_gateway.id
  vpc_id                                          = module.dev_account_vpc.vpc_id
  transit_gateway_default_route_table_association = module.shared_account_transit_gateway.default_route_table_association
  transit_gateway_default_route_table_propagation = module.shared_account_transit_gateway.default_route_table_propagation
  common_tags                                     = var.common_tags
  transit_gateway_vpc_attachment_tags             = var.transit_gateway_vpc_attachment_tags
  transit_gateway_vpc_attachment_resource_prefix  = var.transit_gateway_vpc_attachment_resource_prefix
  environment_name                                = var.dev_account_environment_name

  providers = {
    aws = aws.dev
  }
}

module "stg_account_transit_gateway_vpc_attachment" {
  source = "../../../modules/aws/network/transit_gateway_vpc_attachment"

  subnet_ids                                      = module.stg_account_vpc.private_subnet_ids
  transit_gateway_id                              = module.shared_account_transit_gateway.id
  vpc_id                                          = module.stg_account_vpc.vpc_id
  transit_gateway_default_route_table_association = module.shared_account_transit_gateway.default_route_table_association
  transit_gateway_default_route_table_propagation = module.shared_account_transit_gateway.default_route_table_propagation
  common_tags                                     = var.common_tags
  transit_gateway_vpc_attachment_tags             = var.transit_gateway_vpc_attachment_tags
  transit_gateway_vpc_attachment_resource_prefix  = var.transit_gateway_vpc_attachment_resource_prefix
  environment_name                                = var.stg_account_environment_name

  providers = {
    aws = aws.stg
  }
}

module "prod_account_transit_gateway_vpc_attachment" {
  source = "../../../modules/aws/network/transit_gateway_vpc_attachment"

  subnet_ids                                      = module.prod_account_vpc.private_subnet_ids
  transit_gateway_id                              = module.shared_account_transit_gateway.id
  vpc_id                                          = module.prod_account_vpc.vpc_id
  transit_gateway_default_route_table_association = module.shared_account_transit_gateway.default_route_table_association
  transit_gateway_default_route_table_propagation = module.shared_account_transit_gateway.default_route_table_propagation
  common_tags                                     = var.common_tags
  transit_gateway_vpc_attachment_tags             = var.transit_gateway_vpc_attachment_tags
  transit_gateway_vpc_attachment_resource_prefix  = var.transit_gateway_vpc_attachment_resource_prefix
  environment_name                                = var.prod_account_environment_name

  providers = {
    aws = aws.prod
  }
}

module "shared_account_transit_gateway_route_table" {
  source = "../../../modules/aws/network/transit_gateway_route_table"

  transit_gateway_id                          = module.shared_account_transit_gateway.id
  common_tags                                 = var.common_tags
  transit_gateway_route_table_tags            = var.transit_gateway_route_table_tags
  transit_gateway_route_table_resource_prefix = var.transit_gateway_route_table_resource_prefix
  environment_name                            = var.shared_account_environment_name

  providers = {
    aws = aws.shared
  }
}

module "shared_account_transit_gateway_route_table_attachment" {
  source = "../../../modules/aws/network/transit_gateway_route_table_attachment"

  route_table_associations = local.route_table_associations
  route_table_propagations = local.route_table_propagations

  providers = {
    aws = aws.shared
  }
}

#####
# Either you propagate or you add routes manually
#####
# module "shared_account_transit_gateway_route" {
#   source = "../../../modules/aws/network/transit_gateway_route"

#   transit_gateway_routes = local.shared_account_transit_gateway_routes

#   providers = {
#     aws = aws.shared
#   }
# }

# module "dev_account_transit_gateway_route" {
#   source = "../../../modules/aws/network/transit_gateway_route"

#   transit_gateway_routes = local.dev_account_transit_gateway_routes

#   providers = {
#     aws = aws.dev
#   }
# }

module "shared_account_route_to_transit_gateway" {
  source = "../../../modules/aws/network/route"

  routes = local.shared_account_transit_gateway_routes

  providers = {
    aws = aws.shared
  }
}

module "dev_account_route_to_transit_gateway" {
  source = "../../../modules/aws/network/route"

  routes = local.dev_account_transit_gateway_routes

  providers = {
    aws = aws.dev
  }
}

module "stg_account_route_to_transit_gateway" {
  source = "../../../modules/aws/network/route"

  routes = local.stg_account_transit_gateway_routes

  providers = {
    aws = aws.stg
  }
}

module "prod_account_route_to_transit_gateway" {
  source = "../../../modules/aws/network/route"

  routes = local.prod_account_transit_gateway_routes

  providers = {
    aws = aws.prod
  }
}
