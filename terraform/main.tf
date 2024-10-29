provider "aws" {
  region     = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}


resource "aws_security_group" "boogoo-vsg" {
  name        = "boogoo-svg"
  description = "Allow http inbound traffic"


  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "tf-boogoo-vsg"
  }
}

resource "aws_instance" "boogoo-ec2" {
  instance_type          = "t2.micro"
  ami                    = "ami-0e86e20dae9224db8"
  key_name               = aws_key_pair.key_pair.key_name
  vpc_security_group_ids = [aws_security_group.boogoo-vsg.id]

  user_data = file("setup.sh")

  tags = {
    Name = "tf-boogoo-ec2"
  }
}
