resource "aws_instance" "ec2_instance" {
  ami           = data.aws_ami.ami_id.id
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.security.id]
  key_name               = "nextwork-key"

  tags = {
    Name = "MyEC2Instance"
  }

}

resource "aws_security_group" "security" {
  name        = "allow_traffic"
  description = "Allow outbound and inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
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