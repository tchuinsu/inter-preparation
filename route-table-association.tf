# Resource: aws_route_table_association   REFERT   VIDEO 30: 00 PART 3 
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association

resource "aws_route_table_association" "eks-public-subnet-01-association" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.public-subnet-01.id     

  # The ID of the routing table to associate with.
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "eks-public-subnet-02-association" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.public-subnet-02.id

  # The ID of the routing table to associate with.
  route_table_id = aws_route_table.public.id
}


resource "aws_route_table_association" "eks-private-subnet-01-association" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.private_subnets_eks_ec2_01.id     

  # The ID of the routing table to associate with.
  route_table_id = aws_route_table.eks-private-01-route.id     
}

resource "aws_route_table_association" "eks-private-subnet-02-association" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.private_subnets_eks_ec2_02.id

  # The ID of the routing table to associate with.
  route_table_id = aws_route_table.eks-private-02-route.id
}


resource "aws_route_table_association" "db-private-subnet-01-association" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.private-subnet-db-01.id

  # The ID of the routing table to associate with.
  route_table_id = aws_route_table.db-private-01-route.id
}

resource "aws_route_table_association" "db-private-subnet-02-association" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.private-subnet-db-02.id

  # The ID of the routing table to associate with.
  route_table_id = aws_route_table.db-private-02-route.id
}

