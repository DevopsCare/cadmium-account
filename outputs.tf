/*
 * Copyright (C) 2019 Risk Focus, Inc. - All Rights Reserved
 * You may use, distribute and modify this code under the
 * terms of the Apache License Version 2.0.
 * http://www.apache.org/licenses
 */

output "subaccount_id" {
  value = aws_organizations_account.account.id
}

output "subaccount_role_arn" {
  value = "arn:aws:iam::${aws_organizations_account.account.id}:role/${aws_organizations_account.account.role_name}"
}

output "subaccount_signin_url" {
  value = "https://signin.aws.amazon.com/switchrole?account=${aws_organizations_account.account.id}&roleName=${aws_organizations_account.account.role_name}&displayName=${var.project_prefix}"
}

output "dns_zone_id" {
  value = aws_route53_zone.primary.zone_id
}

output "dns_zone_name" {
  value = "${var.project_prefix}.${var.org_fqdn}"
}

output "dns_zone_nameservers" {
  value = aws_route53_zone.primary.name_servers
}

