variable "cloudwatch_log_group_resource_prefix" {
  type        = string
  description = "The prefix name convention for CloudWatch Log Group object."
}

variable "environment_name" {
  type        = string
  description = "The reference name of the current environment."
}

variable "cloudwatch_log_group_tier_name" {
  type        = string
  description = "The tier name convention for CloudWatch Log Group object."
}

variable "cloudwatch_log_group_retention_in_days" {
  type        = number
  description = "Specifies the number of days you want to retain log events in the specified log group."
}

variable "cloudwatch_log_group_kms_key_id" {
  type        = string
  description = "The ARN of the KMS Key to use when encrypting log data. Please note, after the AWS KMS CMK is disassociated from the log group, AWS CloudWatch Logs stops encrypting newly ingested data for the log group. All previously ingested data remains encrypted, and AWS CloudWatch Logs requires permissions for the CMK whenever the encrypted data is requested."
}

variable "common_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to all resources."
}

variable "cloudwatch_log_group_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to CloudWatch Log Group."
}
