resource "aws_instance" "roboshop-mongodb" {
     #left side arguments name are fixed and cannot be changed... ami, instance_type..
    ami = var.ami_id
    instance_type = var.instance_type
    security_groups = [aws_security_group.roboshop.id]

    tags = var.ec2_tags
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
