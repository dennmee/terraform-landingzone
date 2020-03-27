resource "kubernetes_config_map" "this" {
  metadata {
    name      = var.metadata_name
    namespace = var.metadata_namespace
  }

  data = {
    mapRoles = var.data_payload
  }

  depends_on = [
    null_resource.k8s_api,
    null_resource.k8s_kubectl
  ]
}

########################################################
# Wait for the EKS API Endpoint to be ready
########################################################
resource "null_resource" "k8s_api" {
  provisioner "local-exec" {
    command = "until curl -k -s $K8S_API_ENDPOINT/healthz > /dev/null; do sleep 4; done"
    environment = {
      K8S_API_ENDPOINT = "${var.k8s_endpoint_url}"
    }
  }
}

########################################################
# Wait for the K8S config to be ready
########################################################
resource "null_resource" "k8s_kubectl" {
  provisioner "local-exec" {
    command = "until test -f $K8S_KUBECTL_PATH; do sleep 4; done; sleep 4"
    environment = {
      K8S_KUBECTL_PATH = "${var.k8s_kubectl_path}"
    }
  }
}
