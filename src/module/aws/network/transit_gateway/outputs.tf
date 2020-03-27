output "arn" {
  value       = aws_ec2_transit_gateway.this.arn
  description = "The Amazon Resource Name (ARN) of the EC2 Transit Gateway."
}

output "id" {
  value       = aws_ec2_transit_gateway.this.id
  description = "EC2 Transit Gateway identifier."
}

output "resource_share_arn" {
  value       = var.share_transit_gateway ? aws_ram_resource_share.this[0].arn : ""
  description = "The Amazon Resource Name (ARN) of the Transit Gateway resource share."
}

output "resource_share_id" {
  value       = var.share_transit_gateway ? aws_ram_resource_share.this[0].id : ""
  description = "The Transit Gateway resource share identifier."
}

output "default_route_table_association" {
  value       = local.default_route_table_association == "enabled" ? true : false
  description = "Boolean flag to check if EC2 Transit Gateway has default association enabled/disabled."
}

output "default_route_table_propagation" {
  value       = local.default_route_table_propagation == "enabled" ? true : false
  description = "Boolean flag to check if EC2 Transit Gateway has default propagation enabled/disabled."
}
