########################################################
# K8S Service Account
########################################################
resource "kubernetes_service_account" "this" {
  metadata {
    name      = "cluster-autoscaler"
    namespace = "kube-system"

    labels = {
      k8s-addon = "cluster-autoscaler.addons.k8s.io"
      k8s-app   = "cluster-autoscaler"
    }
  }

  depends_on = [
    null_resource.k8s_api
  ]
}

########################################################
# K8S Cluster Role
########################################################
resource "kubernetes_cluster_role" "this" {
  metadata {
    name = "cluster-autoscaler"

    labels = {
      k8s-addon = "cluster-autoscaler.addons.k8s.io"
      k8s-app   = "cluster-autoscaler"
    }
  }

  rule {
    api_groups = [""]
    resources  = ["events", "endpoints"]
    verbs      = ["create", "patch"]
  }

  rule {
    api_groups = [""]
    resources  = ["pods/eviction"]
    verbs      = ["create"]
  }

  rule {
    api_groups = [""]
    resources  = ["pods/status"]
    verbs      = ["update"]
  }

  rule {
    api_groups     = [""]
    resources      = ["endpoints"]
    resource_names = ["cluster-autoscaler"]
    verbs          = ["get", "update"]
  }

  rule {
    api_groups = [""]
    resources  = ["nodes"]
    verbs      = ["watch", "list", "get", "update"]
  }

  rule {
    api_groups = [""]
    resources  = ["pods", "services", "replicationcontrollers", "persistentvolumeclaims", "persistentvolumes"]
    verbs      = ["watch", "list", "get"]
  }

  rule {
    api_groups = ["extensions"]
    resources  = ["replicasets", "daemonsets"]
    verbs      = ["watch", "list", "get"]
  }

  rule {
    api_groups = ["policy"]
    resources  = ["poddisruptionbudgets"]
    verbs      = ["watch", "list"]
  }

  rule {
    api_groups = ["apps"]
    resources  = ["statefulsets", "replicasets", "daemonsets"]
    verbs      = ["watch", "list", "get"]
  }

  rule {
    api_groups = ["storage.k8s.io"]
    resources  = ["storageclasses"]
    verbs      = ["watch", "list", "get"]
  }

  rule {
    api_groups = ["batch"]
    resources  = ["jobs"]
    verbs      = ["watch", "list", "get"]
  }

  depends_on = [
    null_resource.k8s_api
  ]
}

########################################################
# K8S Role
########################################################
resource "kubernetes_role" "this" {
  metadata {
    name      = "cluster-autoscaler"
    namespace = "kube-system"

    labels = {
      k8s-addon = "cluster-autoscaler.addons.k8s.io"
      k8s-app   = "cluster-autoscaler"
    }
  }

  rule {
    api_groups = [""]
    resources  = ["configmaps"]
    verbs      = ["create"]
  }

  rule {
    api_groups     = [""]
    resources      = ["configmaps"]
    resource_names = ["cluster-autoscaler-status"]
    verbs          = ["delete", "get", "update"]
  }

  depends_on = [
    null_resource.k8s_api
  ]
}

########################################################
# K8S Cluster Role Binding
########################################################
resource "kubernetes_cluster_role_binding" "this" {
  metadata {
    name = "cluster-autoscaler"

    labels = {
      k8s-addon = "cluster-autoscaler.addons.k8s.io"
      k8s-app   = "cluster-autoscaler"
    }
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-autoscaler"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "cluster-autoscaler"
    namespace = "kube-system"
  }

  depends_on = [
    null_resource.k8s_api
  ]
}

########################################################
# K8S Role Binding
########################################################
resource "kubernetes_role_binding" "example" {
  metadata {
    name      = "cluster-autoscaler"
    namespace = "kube-system"

    labels = {
      k8s-addon = "cluster-autoscaler.addons.k8s.io"
      k8s-app   = "cluster-autoscaler"
    }
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = "cluster-autoscaler"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "cluster-autoscaler"
    namespace = "kube-system"
  }

  depends_on = [
    null_resource.k8s_api
  ]
}

########################################################
# K8S Deployment
########################################################
resource "kubernetes_deployment" "example" {
  metadata {
    name      = "cluster-autoscaler"
    namespace = "kube-system"

    labels = {
      app = "cluster-autoscaler"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "cluster-autoscaler"
      }
    }

    template {
      metadata {
        labels = {
          app = "cluster-autoscaler"
        }
      }

      spec {
        service_account_name = "cluster-autoscaler"

        node_selector = {
          intent = "control-apps"
        }

        container {
          image = "k8s.gcr.io/cluster-autoscaler:v1.14.6"
          name  = "cluster-autoscaler"

          resources {
            limits {
              cpu    = "100m"
              memory = "300Mi"
            }
            requests {
              cpu    = "100m"
              memory = "300Mi"
            }
          }

          command = concat(
            [
              "./cluster-autoscaler",
              "--v=4",
              "--stderrthreshold=info",
              "--cloud-provider=aws",
              "--skip-nodes-with-local-storage=false",
            ],
            local.cluster_autoscaler_nodes,
            [
              "--expander=random",
              "--expendable-pods-priority-cutoff=-10",
              "--scale-down-unneeded-time=2m0s",
              "--scale-down-unready-time=3m0s",
              "--scale-down-delay-after-add=2m0s",
              "--scale-down-utilization-threshold=0.7",
              "--balance-similar-node-groups",
              "--max-total-unready-percentage=75",
              "--ok-total-unready-count=20",
              "--max-empty-bulk-delete=30"
            ]
          )

          env {
            name  = "AWS_REGION"
            value = data.aws_region.current.name
          }

          volume_mount {
            name       = "ssl-certs"
            mount_path = "/etc/ssl/certs/ca-certificates.crt"
            read_only  = true
          }

          image_pull_policy = "Always"
        }

        volume {
          name = "ssl-certs"
          host_path {
            path = "/etc/ssl/certs/ca-bundle.crt"
          }
        }
      }
    }
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
