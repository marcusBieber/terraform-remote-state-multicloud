resource "aws_security_group" "ec2_sg" {
  name = "Multicloud-EC2-SG"
  description = "Allow SSh"

  ingress {
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

resource "aws_instance" "ec2" {
  ami = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.ec2_sg.id]
  tags = {
    Name = "Multicloud-EC2"
  }
}
