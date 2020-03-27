locals {
  cluster_autoscaler_nodes = formatlist("--nodes=0:5:%s", var.autoscaling_group_names)
}
