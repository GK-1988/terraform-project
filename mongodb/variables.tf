variable "ami_id" {
    type = string
    default = "ami-0055977a6e828a4f4"
    description = "AMI ID for EC2 Instance"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
    description = "EC2 Instance Type"
}


