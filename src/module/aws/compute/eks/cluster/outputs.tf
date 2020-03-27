output "id" {
  description = "The name of the cluster."
  value       = aws_eks_cluster.this.id
}

output "arn" {
  description = "The Amazon Resource Name (ARN) of the cluster."
  value       = aws_eks_cluster.this.arn
}

output "certificate_authority_data" {
  description = "Nested base64 encoded certificate data required to communicate with your cluster."
  value       = aws_eks_cluster.this.certificate_authority[0].data
}

output "endpoint" {
  description = "The endpoint for your EKS Kubernetes API."
  value       = aws_eks_cluster.this.endpoint
}

output "identity" {
  description = "Nested attribute containing identity provider information for your cluster."
  value       = aws_eks_cluster.this.identity
}

output "platform_version" {
  description = "The platform version for the cluster."
  value       = aws_eks_cluster.this.platform_version
}

output "status" {
  description = "The status of the EKS cluster."
  value       = aws_eks_cluster.this.status
}

output "version" {
  description = "The Kubernetes server version for the cluster."
  value       = aws_eks_cluster.this.version
}
