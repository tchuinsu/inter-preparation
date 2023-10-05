# Resource: aws_nat_gateway
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway

# two ip address that needs to be associate

resource "aws_nat_gateway" "gw1" {
  # depends_on = [
  #  aws_vpc.main,
  #  aws_subnet.eks-public-subnet-01,
  #  aws_eip.nat1
  #]

  # The Allocation ID of the Elastic IP address for the gateway.
  allocation_id = aws_eip.nat1.id

  # The Subnet ID of the subnet in which to place the gateway.
  subnet_id = aws_subnet.public-subnet-01.id

  # A map of tags to assign to the resource.

  tags = merge(var.common_tags, {
    Name = format("%s-%s-%s-vpc-nat-01", var.common_tags["AssetID"], var.common_tags["Environment"], var.common_tags["Project"])
    },
  )
  
}

resource "aws_nat_gateway" "gw2" {
 # depends_on = [
 #   aws_vpc.main,
 #   aws_subnet.eks-public-subnet-02,
 #   aws_eip.nat2
 # ]

  # The Allocation ID of the Elastic IP address for the gateway.
  allocation_id = aws_eip.nat2.id

  # The Subnet ID of the subnet in which to place the gateway.
  subnet_id = aws_subnet.public-subnet-02.id

  # A map of tags to assign to the resource.
 tags = merge(var.common_tags, {
    Name = format("%s-%s-%s-vpc-nat-02", var.common_tags["AssetID"], var.common_tags["Environment"], var.common_tags["Project"])
    },
  )
}





