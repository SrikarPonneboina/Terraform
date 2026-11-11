resource "aws_instance" "tfvars" {
     #left side arguments name are fixed and cannot be changed... ami, instance_type..arguments pre-defined by the Terraform AWS Provider
    ami = data.aws_ami.joindevops.id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.tfvars.id]

    tags = merge(var.ec2_tags,
    {
        Name = "roboshop-tfvars-${var.environment}"
    })
}

resource "aws_security_group" "tfvars" {

    name = "roboshop-tfvars-${var.environment}"
    description = "Allow connection to monogdb"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = merge(
        var.ec2_tags,
        {  
        Name = "roboshop-tfvars-${var.environment}"
        }
    )

    lifecycle {                             #if there is edit in the security group it creates creates sg first and then attaches it to instance and delete old sg
      create_before_destroy = true          #  create before destroy due to this
    }
  
}
