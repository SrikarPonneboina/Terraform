resource "aws_instance" "data_source" {
    ami = data.aws_ami.joindevops.id
    instance_type = var.instance_type
    vpc_security_group_ids = [ aws_security_group.data_source.id ]

    tags = {
      Name = "data-source-demo"
    }
}

resource "aws_security_group" "data_source" {
    name = "data-source-sg"
    description = "This is sg"

    ingress {
        from_port = 0
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "tcp"
    }
    egress {
        from_port = 0
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "-1"
    }

    tags = {
      Name = "data-source-demo"
    }
}