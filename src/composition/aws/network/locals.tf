locals {
  terraform_assume_role_name = "Administrator"

  route_table_associations = list(
    map(
      "transit_gateway_attachment_id",
      module.shared_account_transit_gateway_vpc_attachment.id,
      "transit_gateway_route_table_id",
      module.shared_account_transit_gateway_route_table.id,
    ),
    map(
      "transit_gateway_attachment_id",
      module.dev_account_transit_gateway_vpc_attachment.id,
      "transit_gateway_route_table_id",
      module.shared_account_transit_gateway_route_table.id,
    ),
    map(
      "transit_gateway_attachment_id",
      module.stg_account_transit_gateway_vpc_attachment.id,
      "transit_gateway_route_table_id",
      module.shared_account_transit_gateway_route_table.id,
    ),
    map(
      "transit_gateway_attachment_id",
      module.prod_account_transit_gateway_vpc_attachment.id,
      "transit_gateway_route_table_id",
      module.shared_account_transit_gateway_route_table.id,
    ),
  )

  route_table_propagations = list(
    map(
      "transit_gateway_attachment_id",
      module.shared_account_transit_gateway_vpc_attachment.id,
      "transit_gateway_route_table_id",
      module.shared_account_transit_gateway_route_table.id,
    ),
    map(
      "transit_gateway_attachment_id",
      module.dev_account_transit_gateway_vpc_attachment.id,
      "transit_gateway_route_table_id",
      module.shared_account_transit_gateway_route_table.id,
    ),
    map(
      "transit_gateway_attachment_id",
      module.stg_account_transit_gateway_vpc_attachment.id,
      "transit_gateway_route_table_id",
      module.shared_account_transit_gateway_route_table.id,
    ),
    map(
      "transit_gateway_attachment_id",
      module.prod_account_transit_gateway_vpc_attachment.id,
      "transit_gateway_route_table_id",
      module.shared_account_transit_gateway_route_table.id,
    ),
  )

  # shared_account_transit_gateway_routes = list(
  #   map(
  #     "destination_cidr_block",
  #     var.dev_account_cidr_block,
  #     "transit_gateway_attachment_id",
  #     module.dev_account_transit_gateway_vpc_attachment.id,
  #     "transit_gateway_route_table_id",
  #     module.dev_account_transit_gateway_route_table.id,
  #   ),
  # )

  # dev_account_transit_gateway_routes = list(
  #   map(
  #     "destination_cidr_block",
  #     var.shared_account_cidr_block,
  #     "transit_gateway_attachment_id",
  #     module.shared_account_transit_gateway_vpc_attachment.id,
  #     "transit_gateway_route_table_id",
  #     module.shared_account_transit_gateway_route_table.id,
  #   ),
  # )

  shared_account_transit_gateway_routes = concat(
    [
      for route_table_id in module.shared_account_vpc.private_route_table_id : {
        "route_table_id"         = route_table_id,
        "destination_cidr_block" = module.dev_account_vpc.vpc_cidr_block,
        "gateway_id"             = module.shared_account_transit_gateway.id,
      }
    ],
    [
      for route_table_id in module.shared_account_vpc.private_route_table_id : {
        "route_table_id"         = route_table_id,
        "destination_cidr_block" = module.stg_account_vpc.vpc_cidr_block,
        "gateway_id"             = module.shared_account_transit_gateway.id,
      }
    ],
    [
      for route_table_id in module.shared_account_vpc.private_route_table_id : {
        "route_table_id"         = route_table_id,
        "destination_cidr_block" = module.prod_account_vpc.vpc_cidr_block,
        "gateway_id"             = module.shared_account_transit_gateway.id,
      }
    ]
  )

  dev_account_transit_gateway_routes = [
    for route_table_id in module.dev_account_vpc.private_route_table_id : {
      "route_table_id"         = route_table_id,
      "destination_cidr_block" = module.shared_account_vpc.vpc_cidr_block,
      "gateway_id"             = module.shared_account_transit_gateway.id,
    }
  ]

  stg_account_transit_gateway_routes = [
    for route_table_id in module.stg_account_vpc.private_route_table_id : {
      "route_table_id"         = route_table_id,
      "destination_cidr_block" = module.shared_account_vpc.vpc_cidr_block,
      "gateway_id"             = module.shared_account_transit_gateway.id,
    }
  ]

  prod_account_transit_gateway_routes = [
    for route_table_id in module.prod_account_vpc.private_route_table_id : {
      "route_table_id"         = route_table_id,
      "destination_cidr_block" = module.shared_account_vpc.vpc_cidr_block,
      "gateway_id"             = module.shared_account_transit_gateway.id,
    }
  ]
}
