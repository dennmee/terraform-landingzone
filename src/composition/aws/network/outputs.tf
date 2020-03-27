output "shared_account_vpc_id" {
  value       = module.shared_account_vpc.vpc_id
  description = "The ID of the VPC in the Shared account"
}

output "shared_account_vpc_arn" {
  value       = module.shared_account_vpc.vpc_arn
  description = "Amazon Resource Name (ARN) in the Shared account"
}

output "shared_account_vpc_cidr_block" {
  value       = module.shared_account_vpc.vpc_cidr_block
  description = "The CIDR block of the VPC in the Shared account"
}

output "shared_account_edge_subnet_ids" {
  value       = module.shared_account_vpc.edge_subnet_ids
  description = "The ID list of the edge subnets in the Shared account"
}

output "shared_account_edge_subnet_arns" {
  value       = module.shared_account_vpc.edge_subnet_arns
  description = "The ARN list of the edge subnets in the Shared account"
}

output "shared_account_private_subnet_ids" {
  value       = module.shared_account_vpc.private_subnet_ids
  description = "The ID list of the private subnets in the Shared account"
}

output "shared_account_private_subnet_arns" {
  value       = module.shared_account_vpc.private_subnet_arns
  description = "The ARN list of the private subnets in the Shared account"
}

output "shared_account_data_subnet_ids" {
  value       = module.shared_account_vpc.data_subnet_ids
  description = "The ID list of the data subnets in the Shared account"
}

output "shared_account_data_subnet_arns" {
  value       = module.shared_account_vpc.data_subnet_arns
  description = "The ARN list of the private subnets in the Shared account"
}

output "dev_account_vpc_id" {
  value       = module.dev_account_vpc.vpc_id
  description = "The ID of the VPC in the Development account"
}

output "dev_account_vpc_arn" {
  value       = module.dev_account_vpc.vpc_arn
  description = "Amazon Resource Name (ARN) in the Development account"
}

output "dev_account_vpc_cidr_block" {
  value       = module.dev_account_vpc.vpc_cidr_block
  description = "The CIDR block of the VPC in the Development account"
}

output "dev_account_edge_subnet_ids" {
  value       = module.dev_account_vpc.edge_subnet_ids
  description = "The ID list of the edge subnets in the Development account"
}

output "dev_account_edge_subnet_arns" {
  value       = module.dev_account_vpc.edge_subnet_arns
  description = "The ARN list of the edge subnets in the Development account"
}

output "dev_account_private_subnet_ids" {
  value       = module.dev_account_vpc.private_subnet_ids
  description = "The ID list of the private subnets in the Development account"
}

output "dev_account_private_subnet_arns" {
  value       = module.dev_account_vpc.private_subnet_arns
  description = "The ARN list of the private subnets in the Development account"
}

output "dev_account_data_subnet_ids" {
  value       = module.dev_account_vpc.data_subnet_ids
  description = "The ID list of the data subnets in the Development account"
}

output "dev_account_data_subnet_arns" {
  value       = module.dev_account_vpc.data_subnet_arns
  description = "The ARN list of the private subnets in the Development account"
}

output "shared_account_transit_gateway_arn" {
  value       = module.shared_account_transit_gateway.arn
  description = "The Amazon Resource Name (ARN) of the EC2 Transit Gateway."
}

output "shared_account_transit_gateway_id" {
  value       = module.shared_account_transit_gateway.id
  description = "EC2 Transit Gateway identifier."
}
