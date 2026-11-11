resource "aws_instance" "roboshop-terraform" {
     #left side arguments name are fixed and cannot be changed... ami, instance_type..arguments pre-defined by the Terraform AWS Provider
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.terraform_sg.id]

    tags = {
      name = "roboshop"
      env = "dev"
      project = "roboshop-practice"
    }
}

resource "aws_security_group" "terraform_sg" {

    name = "terraform_sg"
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
  
}
