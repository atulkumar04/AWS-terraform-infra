resource "aws_vpc" "my-vpc" {
    cidr_block = var.vpc_cidr_block
    instance_tenancy = "default"    
    
    tags = {
        Name = "my-vpc"
    }
}

resource "aws_subnet" "my-subnet-public-1" {
    vpc_id = "${aws_vpc.my-vpc.id}"
    cidr_block = var.subnet_cidr_block
    map_public_ip_on_launch = "true"
    availability_zone = "ap-south-1a"
    tags = {
        Name = "my-subnet-public-1"
    }
}