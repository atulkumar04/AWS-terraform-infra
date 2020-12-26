output "vpc_provisiong" {

  value = aws_vpc.my-vpc
}
output "subnet_provisiong" {

  value = aws_subnet.my-subnet-public-1
}

output "route_provisiong" {

  value = aws_route_table.my-public-rt
}
output "ig_provisiong" {

  value = aws_internet_gateway.my-igw
}
output "ec2_provisioning" {

  value = aws_instance.my-ec2-instance
}
