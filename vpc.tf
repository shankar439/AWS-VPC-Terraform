
resource "aws_vpc" "TF-VPC" {
  cidr_block = var.VPC-cidr

  tags = {
    Name = "TF-VPC"
  }
}


# EC2 Instance Connect Endpoint - EIC
resource "aws_ec2_instance_connect_endpoint" "TF-EIC-Endpoint" {
  subnet_id = aws_subnet.TF-private-ap-south-1a.id
  security_group_ids = [ aws_security_group.TF-SG-Spot.id ]

  tags = {
    Name = "TF-EIC-Endpoint"
  }
}


# Public subnets in region ap-south-1 in all three AZ

resource "aws_subnet" "TF-public-ap-south-1a" {
  cidr_block = var.public-south-1a-cidr
  availability_zone = var.ap-south-1a
  vpc_id = aws_vpc.TF-VPC.id
  map_public_ip_on_launch = true

  tags = {
    Name = "TF-public-ap-south-1a"
  }
}

resource "aws_subnet" "TF-public-ap-south-1b" {
  cidr_block = var.public-south-1b-cidr
  availability_zone = var.ap-south-1b
  vpc_id = aws_vpc.TF-VPC.id
  map_public_ip_on_launch = true

  tags = {
    Name = "TF-public-ap-south-1b"
  }
}

resource "aws_subnet" "TF-public-ap-south-1c" {
  cidr_block = var.public-south-1c-cidr
  availability_zone = var.ap-south-1c
  vpc_id = aws_vpc.TF-VPC.id
  map_public_ip_on_launch = true

  tags = {
    Name = "TF-public-ap-south-1c"
  }
}



# Private subnets in region ap-south-1 in all three AZ

resource "aws_subnet" "TF-private-ap-south-1a" {
  cidr_block = var.private-south-1a-cidr
  availability_zone = var.ap-south-1a
  vpc_id = aws_vpc.TF-VPC.id

  tags = {
    Name = "TF-private-ap-south-1a"
  }
}

resource "aws_subnet" "TF-private-ap-south-1b" {
  cidr_block = var.private-south-1b-cidr
  availability_zone = var.ap-south-1b
  vpc_id = aws_vpc.TF-VPC.id

  tags = {
    Name = "TF-private-ap-south-1b"
  }
}

resource "aws_subnet" "TF-private-ap-south-1c" {
  cidr_block = var.private-south-1c-cidr
  availability_zone = var.ap-south-1c
  vpc_id = aws_vpc.TF-VPC.id

  tags = {
    Name = "TF-private-ap-south-1c"
  }
}