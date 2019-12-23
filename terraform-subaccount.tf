/*
 * Copyright (C) 2019 Risk Focus, Inc. - All Rights Reserved
 * You may use, distribute and modify this code under the
 * terms of the Apache License Version 2.0.
 * http://www.apache.org/licenses
 */

module "terraform_state_backend" {
  source              = "git::https://github.com/cloudposse/terraform-aws-tfstate-backend.git?ref=tags/0.9.0"
  region              = var.aws_region
  namespace           = var.org_rev_fqdn
  environment         = var.project_prefix
  name                = "terraform"
  attributes          = ["state"]
  regex_replace_chars = "/[^a-zA-Z0-9-.]/"
  delimiter           = "."

  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true

  providers = {
    aws = aws.subaccount
  }
}

resource "local_file" "subaccount-backend-config" {
  filename = "${path.root}/${var.project_prefix}-backend.tf-template"
  content  = module.terraform_state_backend.terraform_backend_config
}
