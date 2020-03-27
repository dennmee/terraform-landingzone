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

variable "eks_node_group_tier_name" {
  type        = string
  description = "The tier name convention for EKS Node Group object."
}

variable "eks_node_group_resource_prefix" {
  type        = string
  description = "The prefix name convention for EKS Node Group object."
}

variable "node_role_arn" {
  type        = string
  description = "The Amazon Resource Name (ARN) of the IAM role that provides permissions for the Kubernetes node group to make calls to AWS API operations on your behalf."
}

variable "scaling_config_desired_size" {
  type        = number
  description = "Desired number of worker nodes."
}

variable "scaling_config_max_size" {
  type        = number
  description = "Maximum number of worker nodes."
}

variable "scaling_config_min_size" {
  type        = number
  description = "Minimum number of worker nodes."
}

variable "subnet_ids" {
  type        = list(string)
  description = "Identifiers of EC2 Subnets to associate with the EKS Node Group. These subnets must have the following resource tag: kubernetes.io/cluster/CLUSTER_NAME (where CLUSTER_NAME is replaced with the name of the EKS Cluster)."
}

variable "common_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to all resources."
}

variable "eks_node_group_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to EKS Node Group resource."
}
