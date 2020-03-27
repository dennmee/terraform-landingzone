variable "metadata_name" {
  type        = string
  description = "A string that uniquely identifies this object within the current namespace. This value is used in the path when retrieving an individual object."
}

variable "metadata_namespace" {
  type        = string
  description = "A string with the name of the target namespace."
}

variable "data_payload" {
  type        = string
  description = "The K8S Config Map data payload. Each key must consist of alphanumeric characters, '-', '_' or '.'. Can only contain values with UTF-8 byte sequences."
}

variable "k8s_endpoint_url" {
  type        = string
  description = "The K8S API endpoint url."
}

variable "k8s_kubectl_path" {
  type        = string
  description = "The local K8S config file path."
}
