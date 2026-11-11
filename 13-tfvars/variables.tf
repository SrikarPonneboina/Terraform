# variable "ami_id" {
#     type = string
#     default = "ami-0055977a6e828a4f4"
#     description = "this is ami_id"
# }

# variable "instance_type" {
#     type = string
#     default = "t3.micro"
#     description = "This is instance type for RHEL DevOps-practice"
# }

variable "instance_type" {
  type = string
}

variable "environment" {
  type = string
}

variable "ec2_tags" {
    type = map
    default = {
        Name = "roboshop-mongodb"
        Environment = "dev"
        Terraform = "true"
        Project = "roboshop"
        Component = "mongodb"
    }
}
