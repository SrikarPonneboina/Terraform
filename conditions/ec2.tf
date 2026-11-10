resource "aws_instance" "roboshop-conditions" {
    ami = var.ami_id
    instance_type = var.env[0] == "dev" ? "t3.micro" : "t3.small" #this is the condition that we are using here
    #instance_type = dev == dev ? true : false 
    vpc_security_group_ids = [
    "aws_security_group.conditions.id",
    "aws_security_group.common.id"]

    tags = {
        Name = "roboshop-${var.env[0]}-mongodb" # this becomes roboshop-dev-monogodb
    } 
}

resource "aws_security_group" "common" {
    name = "common"
    description = "These allows ssh connection and HTTP connection for all the instances"

    ingress {
        description = "This allows SSH connection"
        from_port = 22
        to_port = 22
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "tcp"
    }


    ingress {
        description = "This allows HTTP connection"
        from_port = 80
        to_port = 80
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "tcp"
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