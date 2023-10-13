# TF-Internet-GW - Resource IGW for internet access for publica and private subnet resources
resource "aws_internet_gateway" "TF-IGW" {
  vpc_id = aws_vpc.TF-VPC.id

  tags = {
    Name = "TF-IGW"
  }
}

# ElasticIP - Resource ElasticIP EIP for NAT Gateway
resource "aws_eip" "TF-eip-NAT" {
  domain = "vpc"
  tags = {
    Name = "TF-NAT-eip"
  }
}

# TF-NAT-GW - Resource NAT Gateway for internet access for Private subnet resources
resource "aws_nat_gateway" "TF-NAT-GW" {
  subnet_id = aws_subnet.TF-public-ap-south-1a.id
  allocation_id = aws_eip.TF-eip-NAT.id

  tags = {
    Name = "TF-NAT-GW"
  }
}



# TF-Route Table - Resources Route table for all public and private subnets 
resource "aws_route_table" "TF-public-RT" {
  vpc_id = aws_vpc.TF-VPC.id

  tags = {
    Name = "TF-public-RT"
  }
}

resource "aws_route_table" "TF-private-RT" {
  vpc_id = aws_vpc.TF-VPC.id

  tags = {
    Name = "TF-private-RT"
  }
}



# TF-Route Table Association - Resource route table association for all subnets

resource "aws_route_table_association" "TF-public-ap-south-1a-association" {
  route_table_id = aws_route_table.TF-public-RT.id
  subnet_id = aws_subnet.TF-public-ap-south-1a.id
}

resource "aws_route_table_association" "TF-public-ap-south-1b-association" {
  route_table_id = aws_route_table.TF-public-RT.id
  subnet_id = aws_subnet.TF-public-ap-south-1b.id
}

resource "aws_route_table_association" "TF-public-ap-south-1c-association" {
  route_table_id = aws_route_table.TF-public-RT.id
  subnet_id = aws_subnet.TF-public-ap-south-1c.id
}

resource "aws_route_table_association" "TF-private-ap-south-1a-association" {
  route_table_id = aws_route_table.TF-private-RT.id
  subnet_id = aws_subnet.TF-private-ap-south-1a.id
}

resource "aws_route_table_association" "TF-private-ap-south-1b-association" {
  route_table_id = aws_route_table.TF-private-RT.id
  subnet_id = aws_subnet.TF-private-ap-south-1b.id
}

resource "aws_route_table_association" "TF-private-ap-south-1c-association" {
  route_table_id = aws_route_table.TF-private-RT.id
  subnet_id = aws_subnet.TF-private-ap-south-1c.id
}



# AWS-Routes - Resource 'Routes' for public and private subnets 
# to access internet using Internet and NAT Gateway.

resource "aws_route" "TF-public-internet-GW-routes" {
  route_table_id = aws_route_table.TF-public-RT.id
  gateway_id = aws_internet_gateway.TF-IGW.id
  destination_cidr_block = var.all-cidr
}

resource "aws_route" "TF-private-NAT-GW-routes" {
  route_table_id = aws_route_table.TF-private-RT.id
  nat_gateway_id = aws_nat_gateway.TF-NAT-GW.id
  destination_cidr_block = var.all-cidr
}

