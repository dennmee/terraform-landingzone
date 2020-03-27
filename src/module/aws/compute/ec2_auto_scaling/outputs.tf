output "id" {
  description = "The autoscaling group id."
  value       = aws_autoscaling_group.this.id
}

output "arn" {
  description = "The ARN for this AutoScaling Group"
  value       = aws_autoscaling_group.this.arn
}

output "name" {
  description = "The name of the autoscale group"
  value       = aws_autoscaling_group.this.name
}
