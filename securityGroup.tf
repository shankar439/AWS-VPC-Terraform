
# Security Group for EC2 spot Instance 
resource "aws_security_group" "TF-SG-Spot" {
  name = var.TF-SG-Spot
  vpc_id = aws_vpc.TF-VPC.id
  
  ingress {
    description      = "SSH from all CIDR"
    from_port        = var.ssh-portnumber
    to_port          = var.ssh-portnumber
    protocol         = var.tcp-name
    cidr_blocks      = [var.all-cidr]
    ipv6_cidr_blocks = [var.all-cidr-ipv6]
  }
  
  ingress {
    description      = "HTTP from all CIDR"
    from_port        = var.http-portnumber
    to_port          = var.http-portnumber
    protocol         = var.tcp-name
    cidr_blocks      = [var.all-cidr]
    ipv6_cidr_blocks = [var.all-cidr-ipv6]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.all-cidr]
    ipv6_cidr_blocks = [var.all-cidr-ipv6]
  }

  tags = {
    Name = var.TF-SG-Spot
  }
}