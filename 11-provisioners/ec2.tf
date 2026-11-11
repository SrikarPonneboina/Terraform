resource "aws_instance" "provisioners" {
     #left side arguments name are fixed and cannot be changed... ami, instance_type..arguments pre-defined by the Terraform AWS Provider
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.provisioners.id]
    

    provisioner "local-exec" {
    command = "echo 'resource is being created'"
    }

    provisioner "local-exec" {
    command = "echo ${self.private_ip} > inventory.ini"     #takes private ip address from the self created instance aws_instance.provisioners
    }

    provisioner "local-exec" {
    when    = destroy                       #when resource is being destroyed below command will be executed
    command = "echo Resource is being destroyed"
    }

    connection {
    type     = "ssh"
    host     = self.public_ip          # self instance public ip address
    user     = "ec2-user"              # username"ec2-user"
    password = "DevOps321"   
    }

    provisioner "remote-exec" {         #connects to remote server and executed the commands from the list
    inline = [
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]
    }

    tags = var.ec2_tags
}

resource "aws_security_group" "provisioners" {

    name = "provisioners"
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

    tags = {
      Name = "provisioners"
      Environment = "dev"
    }
  
}
