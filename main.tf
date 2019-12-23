/*
 * Copyright (C) 2019 Risk Focus, Inc. - All Rights Reserved
 * You may use, distribute and modify this code under the
 * terms of the Apache License Version 2.0.
 * http://www.apache.org/licenses
 */

provider "aws" {
  alias   = "master"
  region  = var.aws_region
  version = "~> 2.0"
}

provider "aws" {
  alias  = "subaccount"
  region = var.aws_region

  assume_role {
    role_arn = "arn:aws:iam::${aws_organizations_account.account.id}:role/${aws_organizations_account.account.role_name}"
  }
}

module "base_label" {
  source              = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.16.0"
  namespace           = var.org_rev_fqdn
  environment         = var.project_prefix
  regex_replace_chars = "/[^a-zA-Z0-9-.]/"
  delimiter           = "."
}
