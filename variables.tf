/*
 * Copyright (C) 2019 Risk Focus, Inc. - All Rights Reserved
 * You may use, distribute and modify this code under the
 * terms of the Apache License Version 2.0.
 * http://www.apache.org/licenses
 */

variable "aws_region" {
  type = string
}

variable "aws_subaccount_email" {
  type = string
}

variable "master_public_key_contents" {
  type = string
}

variable "org_fqdn" {
  type = string
}

variable "org_rev_fqdn" {
  type = string
}

variable "project_prefix" {
  type = string
}

variable "project_name" {
  type = string
}
