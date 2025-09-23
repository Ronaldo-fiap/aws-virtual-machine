# USER DATA
data "template_file" "user_data" {
  template = file(var.user_data_path)
}

# EC2 INSTANCE
resource "aws_instance" "instance" {
  ami                    = "ami-0c101f26f147fa7fd"
  instance_type          = "t2.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.sg_id]
  user_data_base64       = base64encode(data.template_file.user_data.rendered)

  tags = {
    Name = "StaticSiteVM"
  }
}