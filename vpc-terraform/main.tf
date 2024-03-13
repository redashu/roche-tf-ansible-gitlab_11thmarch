resource "aws_vpc" "ashuvpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "ashu-vpc-roche"
  }
}

# creating subnets 
resource "aws_subnet" "ashu-public-1" {
  vpc_id     = aws_vpc.ashuvpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "ashu-public-subnet1"
  }
}
# creating another subnet 
resource "aws_subnet" "ashu-public-2" {
  vpc_id     = aws_vpc.ashuvpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "ashu-publicsubnet-2"
  }
}

# creating Internet gateway 

resource "aws_internet_gateway" "ashugw" {
  vpc_id = aws_vpc.ashuvpc.id

  tags = {
    Name = "ashugw1"
  }
}

# creating route table

resource "aws_route_table" "ashuroute" {
  vpc_id = aws_vpc.ashuvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ashugw.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    gateway_id = aws_internet_gateway.ashugw.id
  }

  tags = {
    Name = "ashu-route-table"
  }
}

# associate routing table to particular subnet 
resource "aws_route_table_association" "ashu-associate-1" {
    route_table_id = aws_route_table.ashuroute.id
    subnet_id = aws_subnet.ashu-public-1.id
  
}
# associate routing table to particular subnet 
resource "aws_route_table_association" "ashu-associate-2" {
    route_table_id = aws_route_table.ashuroute.id
    subnet_id = aws_subnet.ashu-public-2.id
  
}


