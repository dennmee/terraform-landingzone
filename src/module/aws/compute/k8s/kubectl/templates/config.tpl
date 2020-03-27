apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: ${eks_cluster_auth_base64}
    server: ${eks_cluster_endpoint}
  name: ${eks_cluster_arn}
contexts:
- context:
    cluster: ${eks_cluster_arn}
    user: ${eks_cluster_arn}
  name: ${eks_cluster_arn}
current-context: ${eks_cluster_arn}
kind: Config
preferences: {}
users:
- name: ${eks_cluster_arn}
  user:
    exec:
      apiVersion: ${aws_client_authentication_api_version}
      args:
      - --region
      - ${aws_region}
      - eks
      - get-token
      - --cluster-name
      - ${eks_cluster_name}
      - --role
      - ${aws_administrator_iam_role_arn}
      command: ${aws_authenticator_command}
