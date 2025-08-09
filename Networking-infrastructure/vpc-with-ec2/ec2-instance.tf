resource "aws_instance" "web" {
  ami                    = data.aws_ami.amazon_linux_2.id
  count                  = 1
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  tags                   = { Name = "WebServer" }
}