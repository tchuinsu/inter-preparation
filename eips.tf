# Resource: aws_eip
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip

resource "aws_eip" "nat1" {
  vpc = true
  tags = merge(var.common_tags, {
    Name = format("%s-%s-%s-vpc-nat1-eip-01", var.common_tags["AssetID"], var.common_tags["Environment"], var.common_tags["Project"])
    },
  )
}

resource "aws_eip" "nat2" {
  vpc = true
  tags = merge(var.common_tags, {
    Name = format("%s-%s-%s-vpc-nat1-eip-02", var.common_tags["AssetID"], var.common_tags["Environment"], var.common_tags["Project"])
    },
  )
}


#elastic ip (eip)
#resource "aws_eip" "nat1" {         
#  vpc = true
#  tags = {
#    Name = "adl-eks-vpc-nat-eip-01"
#  }
#}
#
#resource "aws_eip" "nat2" {
#  vpc = true
#  tags = {
#    Name = "adl-eks-vpc-nat-eip-01"
#  }
#}