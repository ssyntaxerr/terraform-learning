provider "aws" {
  region = var.aws_region
}

module "security_group" {
  source = "./modules/sg-module"

  name      = "wordpress-sg"
  http_cidr = ["0.0.0.0/0"]
  ssh_cidr  = [var.my_ip]
}

module "ec2" {
  source = "./modules/ec2-module"

  name              = "wordpress-ec2"
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  key_name          = var.key_name
  security_group_id = module.security_group.sg_id
}
