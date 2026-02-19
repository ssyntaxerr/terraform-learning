resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [var.security_group_id]

  user_data = file("${path.module}/userdata.sh")


  tags = {
    Name = var.name
  }
}
