resource "aws_organizations_account" "this" {
  count                      = 1
  name                       = "${var.name}"
  email                      = "${var.email}"
  iam_user_access_to_billing = "${var.iam_user_access_to_billing}"
  role_name                  = "${var.role_name}"
}
