resource "aws_security_group" "ec2_sg" {
  name        = "Multicloud-EC2-SG"
  description = "Allow SSh"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
  owners = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-amd64-server*"]
  }
}

resource "aws_instance" "ec2" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.ec2_sg.name]
  tags = {
    Name = "Multicloud-EC2"
  }
}
