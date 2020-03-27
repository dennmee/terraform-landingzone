variable "ecr_repository_resource_prefix" {
  type        = string
  description = "The prefix name convention for ECR Repository object."
}

variable "environment_name" {
  type        = string
  description = "The reference name of the current environment."
}

variable "ecr_repository_tier_name" {
  type        = string
  description = "The tier name convention for ECR Repository object."
}

variable "image_tag_mutability" {
  type        = string
  description = "The tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE."
}

variable "scan_on_push" {
  type        = bool
  description = "Indicates whether images are scanned after being pushed to the repository (true) or not scanned (false)."
}

variable "common_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to all resources."
}

variable "ecr_repository_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to ECR Repository."
}
