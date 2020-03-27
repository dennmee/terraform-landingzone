variable "eks_cluster_resource_prefix" {
  type        = string
  description = "The prefix name convention for EKS Cluster object."
}

variable "environment_name" {
  type        = string
  description = "The reference name of the current environment."
}

variable "eks_cluster_tier_name" {
  type        = string
  description = "The tier name convention for EKS Cluster object."
}

variable "eks_cluster_arn" {
  type        = string
  description = "The Amazon Resource Name (ARN) of the EKS cluster."
}

variable "eks_cluster_auth_base64" {
  type        = string
  description = "The base64 encoded certificate data required to communicate with your cluster."
}

variable "eks_cluster_endpoint" {
  type        = string
  description = "The endpoint of EKS Cluster API server."
}

variable "eks_config_map_uid" {
  type        = string
  description = "The uid value from config map. This value is only used to create this resource after config map is set."
}
