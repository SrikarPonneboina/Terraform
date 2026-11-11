resource "aws_instance" "functions" {
     #left side arguments name are fixed and cannot be changed... ami, instance_type..arguments pre-defined by the Terraform AWS Provider
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.functions.id]

    tags = merge (      #this is function that we used here it is merge function we are merging common_tags with curent map
        var.common_tags,
        {
            Name = "functions-demo"
            Component = "component-overwrites-here"
        }       
    )
}

resource "aws_security_group" "functions" {

    name = "functions"
    description = "Allow connections SSH and HTTP"

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
    tags = merge (
    var.common_tags,
    {
        Name = "functions-demo"
        Component = "poc"
    }
    )
  
}
