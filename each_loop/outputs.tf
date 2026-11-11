output "ec2_instance_info" {
    value = aws_instance.roboshop-instances
}

output "frontend_public_ip" {
    value = aws_instance.roboshop-instances["frontend"].public_ip
}

output "checking_frontend_public_ip_in_roboshop_instances_which_created" {
    value = lookup(aws_instance.roboshop-instances, "frontend").public_ip
}