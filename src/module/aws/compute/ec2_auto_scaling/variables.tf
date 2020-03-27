variable "placement_group_resource_prefix" {
  type        = string
  description = "The prefix name convention for Placement Group object."
}

variable "environment_name" {
  type        = string
  description = "The reference name of the current environment."
}

variable "autoscaling_group_tier_name" {
  type        = string
  description = "The tier name convention for AutoScaling Group object."
}

variable "placement_group_strategy" {
  type        = string
  description = "The placement strategy. Allowed values are cluster, partition, spread."
}

variable "instance_profile_resource_prefix" {
  type        = string
  description = "The prefix name convention for Instance Profile object."
}

variable "instance_profile_role_id" {
  type        = string
  description = "The role name to include in the instance profile."
}

variable "instance_types" {
  type        = list(string)
  description = "A list of instance type to use for the AutoScaling Group."
}

variable "launch_template_resource_prefix" {
  type        = string
  description = "The prefix name convention for Launch Template object."
}

variable "block_device_mappings" {
  type        = list(object({ device_name = string, no_device = bool, iops = number, kms_key_id = string, volume_size = number, volume_type = string }))
  description = " A list of nested configuration block to specify volumes to attach to the instance besides the volumes specified by the AMI. Each statement can have the following sub-blocks: device_name = string, no_device = bool, iops = number, kms_key_id = string, volume_size = number, volume_type = string"
}

variable "cpu_credits" {
  type        = string
  description = "The credit option for CPU usage. Can be `standard` or `unlimited`."
}

variable "ebs_optimized" {
  type        = bool
  description = "A flag to enable/disable launch EBS-optimized EC2 Instances. In case ebs optimized is not available in any of the instance type Terraform will throw an error. It is highly recommended to set this flag to `true` in production."
}

variable "image_id" {
  type        = string
  description = "The AMI from which to launch the instance."
}

variable "instance_initiated_shutdown_behavior" {
  type        = string
  description = "Shutdown behavior for the instance. Can be stop or terminate."
}

variable "key_name" {
  type        = string
  description = "The key name to use for the instance."
}

variable "detailed_monitoring_enabled" {
  type        = bool
  description = "A flag to enable/disabledetailed monitoring on the launched EC2 instance."
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "A list of security group IDs to associate with instances."
}

variable "user_data" {
  type        = string
  description = "The user data to provide when launching the instance."
}

variable "common_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to all resources."
}

variable "ec2_instance_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to EC2 Instance resource."
}

variable "ec2_instance_resource_prefix" {
  type        = string
  description = "The prefix name convention for EC2 instance object."
}

variable "launch_template_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to Launch Template resource."
}

# variable "default_target_capacity_type" {
#   type        = string
#   description = "Default target capacity type. Valid values: on-demand, spot."
# }

# variable "total_target_capacity" {
#   type        = number
#   description = "The number of units to request, filled using default_target_capacity_type."
# }

# variable "on_demand_allocation_strategy" {
#   type        = string
#   description = "The order of the launch template overrides to use in fulfilling On-Demand capacity. Valid values: lowestPrice, prioritized."
# }

# variable "spot_allocation_strategy" {
#   type        = string
#   description = "How to allocate the target capacity across the Spot pools. Valid values: diversified, lowestPrice."
# }

# variable "instance_pools_to_use_count" {
#   type        = number
#   description = "Number of Spot pools across which to allocate your target Spot capacity. Valid only when Spot allocation_strategy is set to lowestPrice. In case number is 50 lowest price behave like prioritized strategy."
# }

# variable "ec2_fleet_tags" {
#   type        = map(string)
#   description = "A mapping of tags to assign to EC2 Fleet."
# }

# variable "ec2_fleet_resource_prefix" {
#   type        = string
#   description = "The prefix name convention for EC2 Fleet object."
# }

# variable "terminate_instances" {
#   type        = bool
#   description = "A bool flag to enable/disable whether to terminate instances for an EC2 Fleet if it is deleted successfully."
# }

# variable "terminate_instances_with_expiration" {
#   type        = bool
#   description = "A bool flag to enable/disable whether running instances should be terminated when the EC2 Fleet expires."
# }

# variable "ec2_fleet_type" {
#   type        = string
#   description = "The type of request. Indicates whether the EC2 Fleet only requests the target capacity, or also attempts to maintain it. Valid values: maintain, request."
# }

variable "autoscaling_group_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to Autoscaling Group resource."
}

variable "autoscaling_group_resource_prefix" {
  type        = string
  description = "The prefix name convention for AutoScaling Group object."
}

variable "max_size" {
  type        = number
  description = "The maximum size of the auto scale group."
}

variable "min_size" {
  type        = number
  description = "The minimum size of the auto scale group."
}

variable "ebs_volume_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to EBS Volume resource."
}

variable "ebs_volume_resource_prefix" {
  type        = string
  description = "The prefix name convention for EBS Volume object."
}

variable "desired_capacity" {
  type        = number
  description = "The number of Amazon EC2 instances that should be running in the group."
}

variable "health_check_grace_period" {
  type        = number
  description = "Time (in seconds) after instance comes into service before checking health."
}

variable "health_check_type" {
  type        = string
  description = "Set how health checking is done. This setting can have a value of 'EC2' or 'ELB'."
}

variable "vpc_zone_identifier" {
  type        = list(string)
  description = "A list of subnet IDs to launch resources in."
}

variable "target_group_arns" {
  type        = list(string)
  description = "A list of Application LoadBalancer (ALB) target group ARNs to be associated to the autoscaling group."
}

variable "suspended_processes" {
  type        = list(string)
  description = "A list of processes to suspend for the AutoScaling Group. The allowed values are Launch, Terminate, HealthCheck, ReplaceUnhealthy, AZRebalance, AlarmNotification, ScheduledActions, AddToLoadBalancer. Note that if you suspend either the Launch or Terminate process types, it can prevent your autoscaling group from functioning properly."
}

variable "termination_policies" {
  type        = list(string)
  description = "A list of policies names to decide how the instances in the auto scale group should be terminated. The allowed values are OldestInstance, NewestInstance, OldestLaunchConfiguration, ClosestToNextInstanceHour, OldestLaunchTemplate, AllocationStrategy, Default."
}

variable "enabled_metrics" {
  type        = list(string)
  description = "A list of metrics to collect. The allowed values are GroupMinSize, GroupMaxSize, GroupDesiredCapacity, GroupInServiceInstances, GroupPendingInstances, GroupStandbyInstances, GroupTerminatingInstances, GroupTotalInstances."
}

variable "wait_for_capacity_timeout" {
  type        = string
  description = "A maximum duration that Terraform should wait for ASG instances to be healthy before timing out. Setting this to `0` causes Terraform to skip all Capacity Waiting behavior. The minimum value for production should be `10m`"
}

variable "min_elb_capacity" {
  type        = number
  description = "Setting this causes Terraform to wait for this number of instances from this autoscaling group to show up healthy in the ELB only on creation. Updates will not wait on ELB instance number changes."
}

variable "wait_for_elb_capacity" {
  type        = number
  description = "Setting this will cause Terraform to wait for exactly this number of healthy instances from this autoscaling group in all attached load balancers on both create and update operations. (Takes precedence over min_elb_capacity behavior.)"
}

variable "protect_from_scale_in" {
  type        = bool
  description = "Allows setting instance protection. The autoscaling group will not select instances with this setting for terminination during scale in events."
}

variable "service_linked_role_arn" {
  type        = string
  description = "The ARN of the service-linked role that the ASG will use to call other AWS services. AWS default role name is `AWSServiceRoleForAutoScaling`."
}

variable "on_demand_base_capacity" {
  type        = string
  description = "Absolute minimum amount of desired capacity that must be fulfilled by on-demand instances."
}

variable "on_demand_percentage_above_base_capacity" {
  type        = number
  description = "Percentage split between on-demand and Spot instances above the base on-demand capacity."
}

variable "spot_allocation_strategy" {
  type        = string
  description = "How to allocate capacity across the Spot pools. Valid values: lowest-price, capacity-optimized."
}

# variable "spot_instance_pools" {
#   type        = number
#   description = "Number of Spot pools per availability zone to allocate capacity. EC2 Auto Scaling selects the cheapest Spot pools and evenly allocates Spot capacity across the number of Spot pools that you specify. Number of Spot pools across which to allocate your target Spot capacity. Valid only when Spot allocation_strategy is set to lowest-price. In case number is 50 lowest price behave like prioritized strategy."
# }

variable "spot_max_price" {
  type        = string
  description = "Maximum price per unit hour that the user is willing to pay for the Spot instances. An empty string means the on-demand price."
}

variable "autoscaling_lifecycle_hook_resource_prefix" {
  type        = string
  description = "The prefix name convention for Autoscaling Lifecycle Hook object."
}

variable "default_result" {
  type        = string
  description = "Defines the action the Auto Scaling group should take when the lifecycle hook timeout elapses or if an unexpected failure occurs. The value for this parameter can be either CONTINUE or ABANDON."
}

variable "lifecycle_transition" {
  type        = string
  description = "The instance state to which you want to attach the lifecycle hook. The valid values are: `autoscaling:EC2_INSTANCE_LAUNCHING` and `autoscaling:EC2_INSTANCE_TERMINATING`."
}

variable "notification_metadata" {
  type        = string
  description = "Contains additional information that you want to include any time Auto Scaling sends a message to the notification target."
}

variable "heartbeat_timeout" {
  type        = number
  description = "Defines the amount of time, in seconds, that can elapse before the lifecycle hook times out. When the lifecycle hook times out, Auto Scaling performs the action defined in the DefaultResult parameter."
}

variable "notification_target_arn" {
  type        = string
  description = "The ARN of the notification target that Auto Scaling will use to notify you when an instance is in the transition state for the lifecycle hook. This ARN target can be either an SQS queue or an SNS topic."
}

variable "role_arn" {
  type        = string
  description = "The ARN of the IAM role that allows the Auto Scaling group to publish to the specified notification target."
}
