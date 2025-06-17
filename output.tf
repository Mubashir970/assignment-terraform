output "aws_public_ip" {
  value = aws_instance.my_instance.public_ip
}

output "aws_public_dns" {
  value = aws_instance.my_instance.public_dns
  
}