resource "aws_instance" "roboshop-instances" {
    #left side arguments name are fixed and cannot be changed... ami, instance_type..arguments pre-defined by the Terraform AWS Provider
    #count = 10    # this creates 10 instances
    for_each = var.instances    # length is the function it gives length of instances which is == 10 
    ami = var.ami_id
    instance_type = each.value.instance_type
    vpc_security_group_ids = [
        aws_security_group.common.id,
        aws_security_group.roboshop[each.key].id   # security group id from roboshop-instances.mongodb.id and then redis.id, mysql.id ...from the created list of security groups
        ]
    tags = {
      Name = "${var.project}-${var.environment}-${each.key}"    #Name of the instance 1. roboshop-dev-monogodb then redis, mysql...from the list all comes here
      environment = "${var.environment}"  # you have to give variables in ${value} fro tags..env name dev from the list
      project = "${var.project}"  
    }

}

resource "aws_security_group" "common" {
    name = "${var.project}-${var.environment}-common"    # this is the security group name
    description = "this is a common sg for all instances"

    ingress {    #inbound rules 
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name = "${var.project}-${var.environment}-common"   # this is the name in the security group
      environment = "${var.environment}"
    }
  
}

resource "aws_security_group" "roboshop" {
    for_each = var.instances
    name = "${var.project}-${var.environment}-${each.key}" # this is the security name
    description = "This is instance security group"
    #count = 10    # this creates 10 security groups
    #count = length(var.instances)   # length is the function it gives length of instances which is == 10 


    ingress {
        from_port = each.value.port_no
        to_port = each.value.port_no
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
    Name = "${var.project}-${var.environment}-${each.key}" #this is the Name in security group
    environment = "${var.environment}"  
}
    
}