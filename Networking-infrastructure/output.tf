output "aws_ami" {
  value = data.aws_ami.ami_id.id
}

output "ec2_instance_ip" {
  value = aws_instance.ec2_instance.public_ip
}

output "ec2_instance_private_ip" {
  value = aws_instance.ec2_instance.private_ip

}