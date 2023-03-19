data "aws_ami" "latest-amazon-linux-image" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "jenkin_server" {
  ami                         = data.aws_ami.latest-amazon-linux-image.id
  instance_type               = "t2.micro"
  key_name                    = "terraform_key_pair"
  subnet_id                   = aws_subnet.subnet-1.id
  vpc_security_group_ids      = [aws_default_security_group.my-sg.id]
  availability_zone           = "us-east-1a"
  associate_public_ip_address = true
  user_data                   = file("jenkin_script.sh")
  tags = {
    Name = "jenkin-server"
  }
}
