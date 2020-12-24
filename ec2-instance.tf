resource "aws_instance" "my-ec2-instance" {
    ami = "${lookup(var.AMI, var.aws_region)}"
    instance_type = "t2.micro"
    
    subnet_id = "${aws_subnet.my-subnet-public-1.id}"
    
    vpc_security_group_ids = ["${aws_security_group.ssh-rule.id}"]
    
    key_name = "${aws_key_pair.mumbai-region-key-pair.id}"
       
    connection {
        user = "${var.EC2_USER}"
        private_key = "${file("${var.PRIVATE_KEY_PATH}")}"
    }
}
resource "aws_key_pair" "mumbai-region-key-pair" {
    key_name = "mumbai-region-key-pair"
    public_key = "${file(var.PUBLIC_KEY_PATH)}"
}