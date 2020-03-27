output "id" {
  description = "EKS Cluster name and EKS Node Group name separated by a colon (:)."
  value       = aws_eks_node_group.this.id
}

output "arn" {
  description = "Amazon Resource Name (ARN) of the EKS Node Group."
  value       = aws_eks_node_group.this.arn
}

output "resources" {
  description = " List of map containing information about underlying resources. The objects are: `autoscaling_groups` is a list of objects containing information about AutoScaling Groups, `name` is a string of the AutoScaling Group name and `remote_access_security_group_id` is the string identifier of the remote access EC2 Security Group."
  value       = aws_eks_node_group.this.resources
}

output "status" {
  description = "Status of the EKS Node Group."
  value       = aws_eks_node_group.this.status
}
