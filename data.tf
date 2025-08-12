## Declare the data source
##data "aws_availability_zones" "available" {
##  state = "available"
##}
#
#data "aws_vpc" "main" {    #resource "aws_vpc" "eks"
#  filter {
#    name   = "tag:Name"
#    values = ["11111-dev-pipeline-vpc"]
#  }    
#}
#
#data "aws_subnet" "public_1" {
#  filter {
#    name   = "tag:Name"
#    values = ["11111-dev-pipeline-vpc-public-subnet-01"]
#  }    
#}   