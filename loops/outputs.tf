output "instance_info" {
    value = aws_instance.roboshop-instances
}
output "mongodb_private_ip" {
    value = aws_instance.roboshop-instances[0].private_ip
}