variable "sns_topic_resource_prefix" {
  type        = string
  description = "The prefix name convention for SNS Topic object."
}

variable "environment_name" {
  type        = string
  description = "The reference name of the current environment."
}

variable "policy" {
  type        = string
  description = "The fully-formed AWS policy as JSON."
}

variable "delivery_policy" {
  type        = string
  description = "The SNS delivery policy in JSON. For more information take a look at AWS documentation https://docs.aws.amazon.com/sns/latest/dg/sns-message-delivery-retries.html"
}

variable "application_success_feedback_role_arn" {
  type        = string
  description = "The IAM role permitted to receive success feedback for this topic."
}

variable "application_success_feedback_sample_rate" {
  type        = string
  description = "Percentage of success to sample."
}

variable "application_failure_feedback_role_arn" {
  type        = string
  description = "IAM role for failure feedback."
}

variable "http_success_feedback_role_arn" {
  type        = string
  description = "The IAM role permitted to receive success feedback for this topic."
}

variable "http_success_feedback_sample_rate" {
  type        = string
  description = "Percentage of success to sample."
}

variable "http_failure_feedback_role_arn" {
  type        = string
  description = "IAM role for failure feedback."
}

variable "kms_master_key_id" {
  type        = string
  description = "The ID of an AWS-managed customer master key (CMK) for Amazon SNS or a custom CMK."
}

variable "lambda_success_feedback_role_arn" {
  type        = string
  description = "The IAM role permitted to receive success feedback for this topic."
}

variable "lambda_success_feedback_sample_rate" {
  type        = string
  description = "Percentage of success to sample."
}

variable "lambda_failure_feedback_role_arn" {
  type        = string
  description = "IAM role for failure feedback."
}

variable "sqs_success_feedback_role_arn" {
  type        = string
  description = "The IAM role permitted to receive success feedback for this topic."
}

variable "sqs_success_feedback_sample_rate" {
  type        = string
  description = "Percentage of success to sample."
}

variable "sqs_failure_feedback_role_arn" {
  type        = string
  description = "IAM role for failure feedback."
}

variable "common_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to all resources."
}

variable "sns_topic_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to SNS Topic."
}

variable "sns_topic_tier_name" {
  type        = string
  description = "The tier name convention for SNS Topic object."
}
