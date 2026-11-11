resource "aws_instance" "state-demo" {
     #left side arguments name are fixed and cannot be changed... ami, instance_type..arguments pre-defined by the Terraform AWS Provider
    ami = var.ami_id
    instance_type = local.instance_type
    vpc_security_group_ids = [aws_security_group.state-demo.id]

    tags = var.ec2_tags
}

resource "aws_security_group" "state-demo" {

    name = "state-demo-1"
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
        local.common_tags ,
        {
            Name = "${var.project}-${var.environment}"
        }
    )
  
}
