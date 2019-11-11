output "id" {
  description = "The AWS account id."
  value       = aws_organizations_account.this.id
}

output "arn" {
  description = " The ARN for this account."
  value       = aws_organizations_account.this.arn
}
