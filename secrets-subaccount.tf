/*
 * Copyright (C) 2019 Risk Focus, Inc. - All Rights Reserved
 * You may use, distribute and modify this code under the
 * terms of the Apache License Version 2.0.
 * http://www.apache.org/licenses
 */

locals {
  secrets = [
    "github-ci.username",
    "github-ci.token",
  ]
}

data "aws_ssm_parameter" "src-secrets" {
  count = length(local.secrets)
  name  = "${var.org_rev_fqdn}.terraform.${element(local.secrets, count.index)}"
}

resource "aws_ssm_parameter" "dst-secrets" {
  provider = aws.subaccount

  count = length(local.secrets)
  name  = "${var.org_rev_fqdn}.${var.project_prefix}.terraform.${element(local.secrets, count.index)}"
  type  = "SecureString"
  value = element(data.aws_ssm_parameter.src-secrets.*.value, count.index)
}
