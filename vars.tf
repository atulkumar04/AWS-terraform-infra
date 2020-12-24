variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}


variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "AMI" {
    type = map(string)
    
    default =  {
        ap-south-1 = "ami-0bb8408b37500e3be"
    }
}

variable "PRIVATE_KEY_PATH" {
  default = "mumbai-region-key-pair"
}

variable "PUBLIC_KEY_PATH" {
  default = "mumbai-region-key-pair.pub"
}

variable "EC2_USER" {
  default = "ubuntu"
}