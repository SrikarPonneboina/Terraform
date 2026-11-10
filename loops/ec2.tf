resource "aws_instance" "roboshop-mongodb" {
    #left side arguments name are fixed and cannot be changed... ami, instance_type..arguments pre-defined by the Terraform AWS Provider
    count = 10
    ami = var.ami_id
    instance_type = var.instance_type 
    vpc_security_group_ids = [
        "aws_security_group.common.id",
        "aws_security_group.roboshop-instances.id"
        ]
    tags = {
      Name = "roboshop-${var.environment[0]}-${var.instances[count.index]}"
      environment = "var.environment[0]"
    }

}

resource "aws_security_group" "common" {
    name = "common"
    description = "this is a common sg for all instances"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}

resource "aws_security_group" "roboshop-instances" {
    name = "roboshop-instances"
    description = "This is instance security group"
    count = 10

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1" #here -1 tell it allows all the connections
        cidr_blocks = ["0.0.0.0/0"]
    }

tags = {
    Name = "roboshop-${var.environment[0]}-${var.instances[count.index]}"
    environment = "var.environment[0]"
}
    
}