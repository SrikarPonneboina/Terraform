resource "aws_instance" "roboshop-mongodb" {
    ami = var.ami_id
    instance_type = var.instance_type
    security_groups = [aws_security_group.roboshop.id]
tags = {
    Name = "roboshop-mongodb"
    project = "roboshop"
    environment = "dev"
}
}

resource "aws_security_group" "roboshop" {
    name = "roboshop-terraform"
    description = "This is created by terraform"
    
    ingress {
        description = "This allows SSH connection"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"] 
    }
        ingress {
        description = "This allows SSH connection"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"] 
    }
}
