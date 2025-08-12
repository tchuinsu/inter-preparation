# Resource: aws_vpc
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc

resource "aws_vpc" "main" {
  # The CIDR block for the VPC.
  cidr_block = "10.0.0.0/16"

  # Makes your instances shared on the host.
  instance_tenancy = "default"

  # Required for EKS. Enable/disable DNS support in the VPC.
  enable_dns_support = true

  # Required for EKS. Enable/disable DNS hostnames in the VPC.
  enable_dns_hostnames = true

  # Enable/disable ClassicLink for the VPC.
  enable_classiclink = false

  # Enable/disable ClassicLink DNS Support for the VPC.
  enable_classiclink_dns_support = true

  # Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC.
  assign_generated_ipv6_cidr_block = false

  # A map of tags to assign to the resource.
  tags = merge(var.common_tags, {
          Name = format("%s-%s-%s-vpc", var.common_tags["AssetID"], var.common_tags["Environment"], var.common_tags["Project"])
          },
  )
}



#resource "aws_vpc" "main" {
#cidr_block = var.cidr_block
#instance_tenancy = var.instance_tenancy
#enable_dns_support = var.enable_dns_support
#enable_dns_hostnames = var.enable_dns_hostnames
#enable_classiclink = var.enable_classiclink
#enable_classiclink_dns_support = var.enable_classiclink_dns_support
#assign_generated_ipv6_cidr_block = var.assign_generated_ipv6_cidr_block
#tags = {
#    Name = "adl-eks-vpc"
#  }
#}

#variable "cidr_block" {
#  type = string
#}

#variable "instance_tenancy" {
#  type = string
#}

#variable "enable_dns_support" {
#  type = bool
#}

#variable "enable_dns_hostnames" {
#  type = bool
#}

#variable "enable_classiclink" {
#  type = bool
#}

#variable "enable_classiclink_dns_support" {
#  type = bool
#}

#variable "assign_generated_ipv6_cidr_block" {
#  type = bool
#}

#cidr_block = "10.0.0.0/16"
#instance_tenancy = "default"
#enable_dns_support = true
#enable_dns_hostnames = true
#enable_classiclink = false
#enable_classiclink_dns_support = false
#assign_generated_ipv6_cidr_block = false