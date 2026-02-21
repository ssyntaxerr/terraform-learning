provider "aws" {
    region = var.region
}

resource "aws_instance" "nginx_server" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name

    vpc_security_group_ids = [aws_security_group.nginx_sg.id]
    user_data = file("${path.module}/cloud-init.yaml")

    tags = {
      Name = "Terraform-CloudInit-NGINX"
    }

}

resource "aws_security_group" "nginx_sg" {
    name = "nginx-sg"
    description = "Allow HTTP and SSH"

    ingress {

        description = "HTTP"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

    }

    ingress {

        description = "SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

    }

    egress {

        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]

    }
}