/*
 * Copyright (C) 2019 Risk Focus, Inc. - All Rights Reserved
 * You may use, distribute and modify this code under the
 * terms of the Apache License Version 2.0.
 * http://www.apache.org/licenses
 */

module "primary_label" {
  source  = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.16.0"
  context = module.base_label.context
  name    = "dns"
}

resource "aws_route53_zone" "primary" {
  provider = aws.subaccount
  name     = "${var.project_prefix}.${var.org_fqdn}"
  tags     = module.primary_label.tags
}
