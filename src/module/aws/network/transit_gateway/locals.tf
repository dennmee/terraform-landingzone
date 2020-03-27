locals {
  transit_gateway_auto_accept_shared_attachments = "enable"
  default_route_table_association                = "disable"
  default_route_table_propagation                = "disable"
  transit_gateway_description                    = format("%s %s", lower(var.environment_name), "transit gateway.")
  dns_support                                    = "enable"
  vpn_ecmp_support                               = "disable"
  allow_external_principals                      = false # Never allow accounts outside our Organization to access shares
  principal                                      = var.ram_principal_association != "" ? var.ram_principal_association : data.aws_organizations_organization.current.arn
}
