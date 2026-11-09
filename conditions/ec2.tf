resource "aws_instance" "roboshop-conditions" {
    ami = var.ami_id
    instance_type = var.env == "dev" ? "t3.micro" : "t3.medium"
    vpc_security_group_ids = [aws_security_group.conditions.id]

    tags = {
        Name = "roboshop-conditions"
    }
}

resource "aws_security_group" "conditions" {
    name = "conditions"
    description = "Allows TLS inbound traffic and all outbound traffic"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags ={
        Name = "roboshop-conditons"
    }
  
}