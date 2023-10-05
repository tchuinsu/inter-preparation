# Resource: aws_internet_gateway
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway

resource "aws_internet_gateway" "main" {
  depends_on = [
    aws_vpc.main
  ]

  # The VPC ID to create in.
  vpc_id = aws_vpc.main.id

  # A map of tags to assign to the resource.
 tags = merge(var.common_tags, {
    Name = format("%s-%s-%s-vpc-internet-gateway", var.common_tags["AssetID"], var.common_tags["Environment"], var.common_tags["Project"])
    },
  )
}

#internet-gateway   (igw)
#tags ={
# Name = "adl-eks-vpc-internet-gateway"
#  }
