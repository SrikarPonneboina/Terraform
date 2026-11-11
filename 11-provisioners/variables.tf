variable "ami_id" {
    type = string
    default = "ami-0055977a6e828a4f4"
    description = "this is ami_id"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
    description = "This is instance type for RHEL DevOps-practice"
}

variable "ec2_tags" {
    type = map  
    default = {
        Name = "roboshop"
        Environment = "dev"
        Component = "mongodb"
        terraform = "true"
    }
  
}

variable "instance_password" {
    type = string
    default = "DevOps321"
}