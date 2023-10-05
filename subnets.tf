
# Resource: aws_subnet
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet

resource "aws_subnet" "private_subnets_eks_ec2_01" {
  depends_on = [
    aws_vpc.main
  ]
  # The VPC ID.
  vpc_id = aws_vpc.main.id

  # The CIDR block for the subnet.
  cidr_block = var.private_subnets_eks_ec2[0]         #first element in the list is 1

  # The AZ for the subnet.
  availability_zone = var.aws_availability_zones[0]    # refere on line 128

tags = merge(var.common_tags, {
   Name                                        = format("%s-%s-%s-vpc-private_subnets_eks_ec2_01", var.common_tags["AssetID"], var.common_tags["Environment"], var.common_tags["Project"])
   "kubernetes.io/role/internal-elb"           = "1"
   "kubernetes.io/cluster/${var.cluster_name}" = var.shared
    },
  )                                  #data.aws_subnet.eks_public_subnet_01.id
}                                  
# ---------------------------------------------------------------------------

resource "aws_subnet" "private_subnets_eks_ec2_02" {
  depends_on = [
    aws_vpc.main
  ]
  # The VPC ID.
  vpc_id = aws_vpc.main.id

  # The CIDR block for the subnet.
  cidr_block = var.private_subnets_eks_ec2[1]          #first element in the list is 2

  # The AZ for the subnet.
  availability_zone = var.aws_availability_zones[1]

  tags = merge(var.common_tags, {
   Name                                        = format("%s-%s-%s-vpc-private_subnets_eks_ec2_02", var.common_tags["AssetID"], var.common_tags["Environment"], var.common_tags["Project"])
   "kubernetes.io/role/internal-elb"           = "1"
   "kubernetes.io/cluster/${var.cluster_name}" = var.shared
    },
  )

   ## This is required by Kubernetes to discover subnets where private ELB will be created or to create load balancers in the private subnets
   #"kubernetes.io/role/internal-elb" = "1"

   ## You need to tag your cluster with the tag equal to EKS cluster name (demo-cluster). The value can be owned if you only use it for Kubernetes or share if you share it with other services or other EKS cluster  
   #"kubernetes.io/cluster/${var.cluster_name}" = "shared" # you need to tag your cluster with the tag equal to EKS cluster name. The value can be owned if you only use it for Kubernetes or share if you share it with other services or other EKS cluster

   ## "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }

resource "aws_subnet" "private-subnet-db-01" {
  depends_on = [
    aws_vpc.main
  ]
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnets_db[0]
  availability_zone = var.aws_availability_zones[0]
  tags = merge(var.common_tags, {
    Name                                        = format("%s-%s-%s-vpc-private-subnet-db-01", var.common_tags["AssetID"], var.common_tags["Environment"], var.common_tags["Project"])
    "kubernetes.io/role/internal-elb"           = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = var.shared
    },
  )
}

resource "aws_subnet" "private-subnet-db-02" {
  depends_on = [
    aws_vpc.main
  ]
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnets_db[1]
  availability_zone = var.aws_availability_zones[1]
  tags = merge(var.common_tags, {
    Name                                        = format("%s-%s-%s-vpc-private-subnet-db-02", var.common_tags["AssetID"], var.common_tags["Environment"], var.common_tags["Project"])
    "kubernetes.io/role/internal-elb"           = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = var.shared
    },
  )
}

# ---------------------------------------------------------------------------

resource "aws_subnet" "public-subnet-01" {
  depends_on = [
    aws_vpc.main
  ]

  # Enable EC2 to have public IP at launch time
  map_public_ip_on_launch = true

  # The VPC ID.
  vpc_id = aws_vpc.main.id

  # The CIDR block for the subnet.
  cidr_block = var.public[0]                #first element in the list is 3

  # The AZ for the subnet.
  availability_zone = var.aws_availability_zones[0]

  tags = merge(var.common_tags, {
   Name                                        = format("%s-%s-%s-vpc-public-subnet-01", var.common_tags["AssetID"], var.common_tags["Environment"], var.common_tags["Project"])
   "kubernetes.io/role/internal-elb"           = "1"
   "kubernetes.io/cluster/${var.cluster_name}" = var.shared
    },
  )

   ## This is required by Kubernetes to discover subnets where private ELB will be created or to create load balancers in the private subnets
   #"kubernetes.io/role/internal-elb" = "1"

   ## You need to tag your cluster with the tag equal to EKS cluster name (demo-cluster). The value can be owned if you only use it for Kubernetes or share if you share it with other services or other EKS cluster  
   #"kubernetes.io/cluster/${var.cluster_name}" = "shared" # you need to tag your cluster with the tag equal to EKS cluster name. The value can be owned if you only use it for Kubernetes or share if you share it with other services or other EKS cluster

   ## "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }


# ---------------------------------------------------------------------------

resource "aws_subnet" "public-subnet-02" {
  depends_on = [
    aws_vpc.main
  ]
  # Enable EC2 to have public IP at launch time
  map_public_ip_on_launch = true

  # The VPC ID.
  vpc_id = aws_vpc.main.id

  # The CIDR block for the subnet.
  cidr_block = var.public[1]                  #first element in the list is 4

  # The AZ for the subnet.
  availability_zone = var.aws_availability_zones[1]

  tags = merge(var.common_tags, {       #vpc-public-subnet-02
            Name     = format("%s-%s-%s-bastion-host", var.common_tags["AssetID"], var.common_tags["Environment"], var.common_tags["Project"])
   "kubernetes.io/role/internal-elb"           = "1"
   "kubernetes.io/cluster/${var.cluster_name}" = var.shared
    },
  )

   ## This is required by Kubernetes to discover subnets where private ELB will be created or to create load balancers in the private subnets
   #"kubernetes.io/role/internal-elb" = "1"

   ## You need to tag your cluster with the tag equal to EKS cluster name (demo-cluster). The value can be owned if you only use it for Kubernetes or share if you share it with other services or other EKS cluster  
   #"kubernetes.io/cluster/${var.cluster_name}" = "shared" # you need to tag your cluster with the tag equal to EKS cluster name. The value can be owned if you only use it for Kubernetes or share if you share it with other services or other EKS cluster

   ## "kubernetes.io/cluster/${var.cluster_name}" = "shared"
}


## Declare the data source
#data "aws_availability_zones" "available" {
#  state = "available"
#}
#
## e.g., Create subnets in the first two available availability zones
#
#resource "aws_subnet" "primary" {
#  availability_zone = data.aws_availability_zones.available.names[0]
#
#  # ...
#}
#
#resource "aws_subnet" "secondary" {
#  availability_zone = data.aws_availability_zones.available.names[1]
#
#  # ...
#}


# ---------------------------------------------------------------------------

#resource "aws_subnet" "eks-db-subnet-01" {
# depends_on = [
#   aws_vpc.main
# ]
# # The VPC ID.
# vpc_id = aws_vpc.main.id
#
# # The CIDR block for the subnet.
# cidr_block = "10.0.5.0/24"
#
# # The AZ for the subnet.
# availability_zone = "us-east-1a"
#
# tags = {
#   "Name" = "eks-db-subnet-01"
# }
#}
#
## ---------------------------------------------------------------------------
#
#resource "aws_subnet" "eks-db-subnet-02" {
#  depends_on = [
#    aws_vpc.main
#  ]
#  # The VPC ID.
#  vpc_id = aws_vpc.main.id
#
#  # The CIDR block for the subnet.
#  cidr_block = "10.0.6.0/24"
#
#  # The AZ for the subnet.
#  availability_zone = "us-east-1b"
#
#  tags = {
#    "Name" = "eks-db-subnet-02"
#  }
#}
#-------------------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------------------------------------------------
# old code

## Resource: aws_subnet
## https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet
#
#resource "aws_subnet" "eks-private-subnet-01" {
#  depends_on = [
#    aws_vpc.main
#  ]
#  # The VPC ID.
#  vpc_id = aws_vpc.main.id
#
#  # The CIDR block for the subnet.
#  cidr_block = "10.0.1.0/24"
#
#  # The AZ for the subnet.
#  availability_zone = "us-east-1a"
#
#  tags = {
#    "Name" = "eks-private-subnet-01"
#
#    # This is required by Kubernetes to discover subnets where private ELB will be created or to create load balancers in the private subnets
#    "kubernetes.io/role/internal-elb" = "1"
#
#    # You need to tag your cluster with the tag equal to EKS cluster name (demo-cluster). The value can be owned if you only use it for Kubernetes or share if you share it with other services or other EKS cluster  
#    "kubernetes.io/cluster/demo-cluster" = "shared" # you need to tag your cluster with the tag equal to EKS cluster name. The value can be owned if you only use it for Kubernetes or share if you share it with other services or other EKS cluster
#
#    # "kubernetes.io/cluster/${var.cluster_name}" = "shared"
#  }
#}
#
## ---------------------------------------------------------------------------
#
#resource "aws_subnet" "eks-private-subnet-02" {
#  depends_on = [
#    aws_vpc.main
#  ]
#  # The VPC ID.
#  vpc_id = aws_vpc.main.id
#
#  # The CIDR block for the subnet.
#  cidr_block = "10.0.2.0/24"
#
#  # The AZ for the subnet.
#  availability_zone = "us-east-1b"
#
#  tags = {
#    "Name" = "eks-private-subnet-02"
#
#    # This is required by Kubernetes to discover subnets where private ELB will be created or to create load balancers in the private subnets
#    "kubernetes.io/role/internal-elb" = "1"
#
#    # You need to tag your cluster with the tag equal to EKS cluster name (demo-cluster). The value can be owned if you only use it for Kubernetes or share if you share it with other services or other EKS cluster  
#    "kubernetes.io/cluster/demo-cluster" = "shared" # you need to tag your cluster with the tag equal to EKS cluster name. The value can be owned if you only use it for Kubernetes or share if you share it with other services or other EKS cluster
#
#    # "kubernetes.io/cluster/${var.cluster_name}" = "shared"
#  }
#}
#
## ---------------------------------------------------------------------------
#
#resource "aws_subnet" "eks-public-subnet-01" {
#  depends_on = [
#    aws_vpc.main
#  ]
#
#  # Enable EC2 to have public IP at launch time
#  map_public_ip_on_launch = true
#
#  # The VPC ID.
#  vpc_id = aws_vpc.main.id
#
#  # The CIDR block for the subnet.
#  cidr_block = "10.0.3.0/24"
#
#  # The AZ for the subnet.
#  availability_zone = "us-east-1a"
#
#  tags = {
#    "Name" = "eks-public-subnet-01"
#
#    # This is required by Kubernetes to discover subnets where private ELB will be created or to create load balancers in the private subnets
#    "kubernetes.io/role/internal-elb" = "1"
#
#    # You need to tag your cluster with the tag equal to EKS cluster name (demo-cluster). The value can be owned if you only use it for Kubernetes or share if you share it with other services or other EKS cluster  
#    "kubernetes.io/cluster/demo-cluster" = "shared" # you need to tag your cluster with the tag equal to EKS cluster name. The value can be owned if you only use it for Kubernetes or share if you share it with other services or other EKS cluster
#
#    # "kubernetes.io/cluster/${var.cluster_name}" = "shared"
#  }
#}
#
## ---------------------------------------------------------------------------
#
#resource "aws_subnet" "eks-public-subnet-02" {
#  depends_on = [
#    aws_vpc.main
#  ]
#  # Enable EC2 to have public IP at launch time
#  map_public_ip_on_launch = true
#
#  # The VPC ID.
#  vpc_id = aws_vpc.main.id
#
#  # The CIDR block for the subnet.
#  cidr_block = "10.0.4.0/24"
#
#  # The AZ for the subnet.
#  availability_zone = "us-east-1b"
#
#  tags = {
#    "Name" = "eks-public-subnet-02"
#
#    # This is required by Kubernetes to discover subnets where private ELB will be created or to create load balancers in the private subnets
#    "kubernetes.io/role/internal-elb" = "1"
#
#    # You need to tag your cluster with the tag equal to EKS cluster name (demo-cluster). The value can be owned if you only use it for Kubernetes or share if you share it with other services or other EKS cluster  
#    "kubernetes.io/cluster/demo-cluster" = "shared" # you need to tag your cluster with the tag equal to EKS cluster name. The value can be owned if you only use it for Kubernetes or share if you share it with other services or other EKS cluster
#
#    # "kubernetes.io/cluster/${var.cluster_name}" = "shared"
#  }
#}
#
#
## ---------------------------------------------------------------------------
#
#resource "aws_subnet" "eks-db-subnet-01" {
#  depends_on = [
#    aws_vpc.main
#  ]
#  # The VPC ID.
#  vpc_id = aws_vpc.main.id
#
#  # The CIDR block for the subnet.
#  cidr_block = "10.0.5.0/24"
#
#  # The AZ for the subnet.
#  availability_zone = "us-east-1a"
#
#  tags = {
#    "Name" = "eks-db-subnet-01"
#  }
#}
#
## ---------------------------------------------------------------------------
#
#resource "aws_subnet" "eks-db-subnet-02" {
#  depends_on = [
#    aws_vpc.main
#  ]
#  # The VPC ID.
#  vpc_id = aws_vpc.main.id
#
#  # The CIDR block for the subnet.
#  cidr_block = "10.0.6.0/24"
#
#  # The AZ for the subnet.
#  availability_zone = "us-east-1b"
#
#  tags = {
#    "Name" = "eks-db-subnet-02"
#  }
#}



# cd Terraform-1/devops-easy-learning/terraform-project/modules/vpc/





























