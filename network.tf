resource "aws_internet_gateway" "my-igw" {
  vpc_id = "${aws_vpc.my-vpc.id}"
  tags = {
    Name = "my-igw"
  }
}

resource "aws_route_table" "my-public-rt" {
  vpc_id = "${aws_vpc.my-vpc.id}"

  route {

    cidr_block = var.route_cidr_block

    gateway_id = "${aws_internet_gateway.my-igw.id}"
  }

  tags = {
    Name = "my-public-rt"
  }
}

resource "aws_route_table_association" "my-rt-public-subnet-1" {
  subnet_id      = "${aws_subnet.my-subnet-public-1.id}"
  route_table_id = "${aws_route_table.my-public-rt.id}"
}

resource "aws_security_group" "ssh-rule" {
  vpc_id = "${aws_vpc.my-vpc.id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = [var.sg_cidr_block]
  }
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [var.sg_cidr_block]
  }
  tags = {
    Name = "ssh-rule"
  }
}