locals {
  launch_template_block_device_delete_on_termination = true
  disable_api_termination                            = false
  instance_resource_type                             = "instance"
  volume_resource_type                               = "volume"
  user_data_base64                                   = base64encode(var.user_data)
  excess_capacity_termination_policy                 = "termination"
  replace_unhealthy_instances                        = true
  instance_interruption_behavior                     = "terminate"
  force_delete                                       = false
  metrics_granularity                                = "1Minute"     # This is the only value available
  on_demand_allocation_strategy                      = "prioritized" # This is the only value available
  spot_instance_pools                                = var.spot_allocation_strategy == "lowest-price" ? length(data.aws_availability_zones.available.names) * length(var.instance_types) : null
  k8s_default_namespace_name                         = "kube-system"
  k8s_default_aws_auth_config_map_name               = "aws-auth"
}
