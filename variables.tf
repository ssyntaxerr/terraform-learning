variable "aws_region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "ami_id" {
  type = string
}

variable "key_name" {
  type = string
}

variable "my_ip" {
  type = string
}
