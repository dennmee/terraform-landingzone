########################################################
# EC2 Placement Group
########################################################
resource "aws_placement_group" "this" {
  name = format(
    "%s-%s-%s-%s",
    lower(var.placement_group_resource_prefix),
    join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name)),
    lower(var.environment_name),
    lower(var.autoscaling_group_tier_name),
  )

  strategy = var.placement_group_strategy
}

########################################################
# EC2 Instance Profile
########################################################
resource "aws_iam_instance_profile" "this" {
  name = format(
    "%s-%s-%s-%s",
    lower(var.instance_profile_resource_prefix),
    join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name)),
    lower(var.environment_name),
    lower(var.autoscaling_group_tier_name),
  )

  role = var.instance_profile_role_id
}

########################################################
# EC2 Launch Template
########################################################
resource "aws_launch_template" "this" {
  count = length(var.instance_types)

  name = format(
    "%s-%s-%s-%s-%s",
    lower(var.launch_template_resource_prefix),
    join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name)),
    lower(var.environment_name),
    lower(var.autoscaling_group_tier_name),
    join("", compact(regex("(^\\w*).(\\d*)?(x)?(\\w)(?:\\w*$)", element(var.instance_types, count.index)))),
  )

  description = format(
    "%s %s %s %s %s",
    join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name)),
    lower(var.environment_name),
    lower(var.autoscaling_group_tier_name),
    element(var.instance_types, count.index),
    "launch template.",
  )

  dynamic "block_device_mappings" {
    for_each = var.block_device_mappings
    content {
      device_name = block_device_mappings.value.device_name
      no_device   = block_device_mappings.value.no_device
      ebs {
        delete_on_termination = local.launch_template_block_device_delete_on_termination
        encrypted             = true
        iops                  = block_device_mappings.value.volume_type != "gp2" ? block_device_mappings.value.iops : 0
        kms_key_id            = block_device_mappings.value.kms_key_id != "" ? block_device_mappings.value.kms_key_id : data.aws_kms_key.ebs_aws.arn
        volume_size           = block_device_mappings.value.volume_size
        volume_type           = block_device_mappings.value.volume_type
      }
    }
  }

  credit_specification {
    cpu_credits = var.cpu_credits
  }

  disable_api_termination = local.disable_api_termination
  ebs_optimized           = var.ebs_optimized

  iam_instance_profile {
    arn = aws_iam_instance_profile.this.arn
  }

  image_id                             = var.image_id
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior
  instance_type                        = element(var.instance_types, count.index)
  key_name                             = var.key_name

  monitoring {
    enabled = var.detailed_monitoring_enabled
  }

  vpc_security_group_ids = var.vpc_security_group_ids
  user_data              = local.user_data_base64

  tag_specifications {
    resource_type = local.instance_resource_type
    tags = merge(
      var.common_tags,
      var.ec2_instance_tags,
      {
        "Name" = format(
          "%s-%s-%s-%s-%s",
          lower(var.launch_template_resource_prefix),
          join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name)),
          lower(var.environment_name),
          lower(var.autoscaling_group_tier_name),
          join("", compact(regex("(^\\w*).(\\d*)?(x)?(\\w)(?:\\w*$)", element(var.instance_types, count.index)))),
        )
      },
    )
  }

  tag_specifications {
    resource_type = local.volume_resource_type
    tags = merge(
      var.common_tags,
      var.ebs_volume_tags,
      {
        "Name" = format(
          "%s-%s-%s-%s-%s",
          lower(var.ebs_volume_resource_prefix),
          join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name)),
          lower(var.environment_name),
          lower(var.autoscaling_group_tier_name),
          join("", compact(regex("(^\\w*).(\\d*)?(x)?(\\w)(?:\\w*$)", element(var.instance_types, count.index)))),
        )
      },
    )
  }

  tags = merge(
    var.common_tags,
    var.launch_template_tags,
    {
      "Name" = format(
        "%s-%s-%s-%s-%s",
        lower(var.launch_template_resource_prefix),
        join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name)),
        lower(var.environment_name),
        lower(var.autoscaling_group_tier_name),
        join("", compact(regex("(^\\w*).(\\d*)?(x)?(\\w)(?:\\w*$)", element(var.instance_types, count.index)))),
      )
    },
  )
}

########################################################
# EC2 Autoscaling Group
########################################################
resource "aws_autoscaling_group" "this" {
  name = format(
    "%s-%s-%s-%s",
    lower(var.autoscaling_group_resource_prefix),
    join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name)),
    lower(var.environment_name),
    lower(var.autoscaling_group_tier_name),
  )

  max_size                  = var.max_size
  min_size                  = var.min_size
  desired_capacity          = var.desired_capacity
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = var.health_check_type
  force_delete              = local.force_delete
  vpc_zone_identifier       = var.vpc_zone_identifier
  target_group_arns         = var.target_group_arns
  suspended_processes       = var.suspended_processes
  termination_policies      = var.termination_policies
  placement_group           = aws_placement_group.this.id
  metrics_granularity       = local.metrics_granularity
  enabled_metrics           = var.enabled_metrics
  wait_for_capacity_timeout = var.wait_for_capacity_timeout
  min_elb_capacity          = var.min_elb_capacity
  wait_for_elb_capacity     = var.wait_for_elb_capacity
  protect_from_scale_in     = var.protect_from_scale_in
  service_linked_role_arn   = var.service_linked_role_arn

  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy            = local.on_demand_allocation_strategy
      on_demand_base_capacity                  = var.on_demand_base_capacity
      on_demand_percentage_above_base_capacity = var.on_demand_percentage_above_base_capacity
      spot_allocation_strategy                 = var.spot_allocation_strategy
      spot_instance_pools                      = local.spot_instance_pools
      spot_max_price                           = var.spot_max_price
    }

    launch_template {
      dynamic "launch_template_specification" {
        for_each = aws_launch_template.this.*
        content {
          launch_template_id = launch_template_specification.value.id
          version            = launch_template_specification.value.latest_version
        }
      }
    }
  }

  dynamic "tag" {
    for_each = merge(
      var.common_tags,
      var.autoscaling_group_tags,
      {
        "Name" = format(
          "%s-%s-%s-%s",
          lower(var.autoscaling_group_resource_prefix),
          join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name)),
          lower(var.environment_name),
          lower(var.autoscaling_group_tier_name),
        )
      }
    )

    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
}

resource "aws_autoscaling_lifecycle_hook" "this" {
  name = format(
    "%s-%s-%s-%s",
    lower(var.autoscaling_lifecycle_hook_resource_prefix),
    join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name)),
    lower(var.environment_name),
    lower(var.autoscaling_group_tier_name),
  )

  autoscaling_group_name  = aws_autoscaling_group.this.name
  default_result          = var.default_result
  lifecycle_transition    = var.lifecycle_transition
  notification_metadata   = var.notification_metadata
  heartbeat_timeout       = var.heartbeat_timeout
  notification_target_arn = var.notification_target_arn
  role_arn                = var.role_arn
}
