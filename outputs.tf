output "instance_public_ip" {
  value = aws_instance.Cloud_Sec_instance[*].public_ip
}
