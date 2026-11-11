output "ec2_instance_info" {
    value = aws_instance.roboshop-instances
}

output "frontend_public_ip" {
    value = aws_instance.roboshop-instances["frontend"].public_ip
}

output "checking_frontend_public_ip_in_roboshop_instances_which_created" {
    value = lookup(aws_instance.roboshop-instances, "frontend").public_ip
}

output "mongodb_private_ip" {
    value = lookup(aws_instance.roboshop-instances,"mongodb").private_ip
}

output "redis_private_ip" {
    value = lookup(aws_instance.roboshop-instances, "redis").private_ip
}

output "mysql_private_ip" {
    value = lookup(aws_instance.roboshop-instances, "mysql").private_ip
}
output "rabbitmq_private_ip" {
    value = lookup(aws_instance.roboshop-instances, "rabbitmq").private_ip
}

output "catalogue_private_ip" {
  value = lookup(aws_instance.roboshop-instances, "catalogue").private_ip
}

output "user_private_ip" {
    value = lookup(aws_instance.roboshop-instances, "user").private_ip
}

output "cart_private_ip" {
    value = lookup(aws_instance.roboshop-instances, "cart").private_ip
}

output "shipping_private_ip" {
    value = lookup(aws_instance.roboshop-instances, "shipping").private_ip
}

output "payment_private_ip" {
    value = lookup(aws_instance.roboshop-instances, "payment").private_ip
}