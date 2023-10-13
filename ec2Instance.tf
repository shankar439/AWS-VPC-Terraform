
# EC2 instance in private subnet 
resource "aws_instance" "ec2-by-terraform" {
  ami = var.ec2-instance-ami
  instance_type = var.instance_type
  subnet_id = aws_subnet.TF-private-ap-south-1a.id
  vpc_security_group_ids = [aws_security_group.TF-SG-Spot.id]
  
  instance_market_options {
    market_type = "spot"
    spot_options {
      max_price = var.spot-max-price
    }
  }

  tags = {
    Name = var.aws_instance-tag-name
  }
}

# OnDemand EC2 instance
resource "aws_instance" "TF-OnDemand" {
  vpc_security_group_ids = [aws_security_group.TF-SG-Spot.id]
  subnet_id = aws_subnet.TF-private-ap-south-1b.id
  ami = var.ec2-instance-ami
  instance_type = var.instance_type

  tags = {
    Name = "TF-OnDemand"
  }
}