output "instance_info" {
    value = aws_instance.roboshop-instances
}
output "instance_info" {
    value = aws_instance.roboshop-instances[0].private_ip
}