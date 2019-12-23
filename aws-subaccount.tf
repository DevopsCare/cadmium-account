/*
 * Copyright (C) 2019 Risk Focus, Inc. - All Rights Reserved
 * You may use, distribute and modify this code under the
 * terms of the Apache License Version 2.0.
 * http://www.apache.org/licenses
 */

resource "aws_organizations_account" "account" {
  provider                   = aws.master
  email                      = var.aws_subaccount_email
  name                       = var.project_name
  iam_user_access_to_billing = "ALLOW"
  role_name                  = "MasterOrganizationAccount"

  lifecycle {
    ignore_changes = [
      name,
      email,
    ]
  }
}

resource "aws_iam_account_alias" "account_alias" {
  provider      = aws.subaccount
  account_alias = replace("${var.org_rev_fqdn}.${var.project_prefix}", ".", "-")
}

resource "aws_key_pair" "masterkey" {
  provider   = aws.subaccount
  public_key = var.master_public_key_contents
  key_name   = "${var.project_prefix} masterkey"
}
