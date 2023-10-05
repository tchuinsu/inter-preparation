# Declare the data source
#data "aws_availability_zones" "available" {
#  state = "available"
#}

#data "aws_vpc" "main" {    #resource "aws_vpc" "eks"
#  filter {
#    name   = "tag:Name"
#    values = ["eks-put-in-one-baskect"]
#  }    
#}
#
#data "aws_subnet" "public_1" {
#  filter {
#    name   = "tag:Name"
#    values = ["public-us-east-1a"]
#  }    
#}   