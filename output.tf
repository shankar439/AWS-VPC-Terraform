output "VPC-name" {
  value = aws_vpc.TF-VPC.id
}

output "ElasticIP" {
  value = aws_eip.TF-eip-NAT.public_ip
}

