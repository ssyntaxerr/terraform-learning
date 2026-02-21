variable "ami" {
    type = string
}

variable "instance_type" {
    type = string
    default = "t3.micro"
}

variable "region" {
    type = string
    default = "eu-north-1"  
}

variable "key_name" {
    type = string  
}