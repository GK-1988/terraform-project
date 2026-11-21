variable "ami_id" {
  type        = string
  default     = "ami-0055977a6e828a4f4"
  description = "AMI ID for EC2 Instance"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "EC2 Instance Type"
}


variable "component" {
  type    = string
  default = "redis"
}

/*  variable "ports" {
  type = list(number)
  default = [
    6379,
    22
  ] 
} */

# variable is converted into 'string'
/* variable "ports" {
    default = ["6379", "22"]
} */

# variable type is 'map'
variable "ports" {
    default = {
        
        redis = 6379
        ssh =  22
    }
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "domain_name" {
  type    = string
  default = "opsify.online"
}