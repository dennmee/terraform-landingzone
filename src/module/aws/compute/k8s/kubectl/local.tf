locals {
  config_output_path                    = "/home/ec2-user/.kube/config"
  aws_client_authentication_api_version = "client.authentication.k8s.io/v1alpha1"
  aws_administrator_iam_role_arn = format(
    "%s%s%s",
    "arn:aws:iam::",
    data.aws_caller_identity.current.account_id,
    ":role/Administrator"
  )
  aws_authenticator_command = "aws"
}
