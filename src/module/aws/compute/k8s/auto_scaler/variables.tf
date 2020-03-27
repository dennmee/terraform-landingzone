variable "autoscaling_group_names" {
  type        = list(string)
  description = "A list of all autoscaling group names used for EKS Worker nodes."
}

variable "k8s_endpoint_url" {
  type        = string
  description = "The K8S API endpoint url."
}

variable "k8s_kubectl_path" {
  type        = string
  description = "The local K8S config file path."
}
