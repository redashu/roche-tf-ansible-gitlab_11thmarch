resource "aws_vpc" "main" {
  cidr_block = "172.31.0.0/16"
}

import {
  to = aws_vpc.main
  id = "vpc-0450e556b14d3a4a7"
}

# subnets 
resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "172.31.16.0/20"

}

import {
  to = aws_subnet.main
  id = "subnet-0290f8549fd6fb2ea"
}