resource "aws_vpc" "main" {
  cidr_block       = var.vpc-cidr-block
  instance_tenancy = "default"
  tags = {
    Name = "main"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "sub-A" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.sub-A-cidr-block
  map_public_ip_on_launch = true
  availability_zone       = "eu-west-1a"
  tags = {
    Name = "sub-A"
  }
}

resource "aws_subnet" "sub-B" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.sub-B-cidr-block
  map_public_ip_on_launch = true
  availability_zone       = "eu-west-1b"
  tags = {
    Name = "sub-B"
  }
}

resource "aws_route_table" "r" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "main"
  }
}

resource "aws_route_table_association" "sub-A-associate" {
  depends_on = [
    aws_subnet.sub-A
  ]
  subnet_id      = aws_subnet.sub-A.id
  route_table_id = aws_route_table.r.id
}

resource "aws_route_table_association" "sub-B-associate" {
  depends_on = [
    aws_subnet.sub-B
  ]
  subnet_id      = aws_subnet.sub-B.id
  route_table_id = aws_route_table.r.id
}

resource "aws_main_route_table_association" "vpc-associate" {
  vpc_id         = aws_vpc.main.id
  route_table_id = aws_route_table.r.id
}