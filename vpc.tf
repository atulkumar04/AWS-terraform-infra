resource "aws_vpc" "my-vpc" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"    
    
    tags = {
        Name = "my-vpc"
    }
}

resource "aws_subnet" "my-subnet-public-1" {
    vpc_id = "${aws_vpc.my-vpc.id}"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "ap-south-1a"
    tags = {
        Name = "my-subnet-public-1"
    }
}