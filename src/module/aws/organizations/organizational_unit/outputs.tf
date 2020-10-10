output "id" {
  description = "Identifier of the organization unit."
  value       = aws_organizations_organizational_unit.this.id
}

output "arn" {
  description = "ARN of the organizational unit."
  value       = aws_organizations_organizational_unit.this.arn
}

output "accounts" {
  description = "List of child accounts for this Organizational Unit."
  value       = aws_organizations_organizational_unit.this.accounts
}
