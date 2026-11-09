variable "ami_id" {
    type = string
    default = "ami-0055977a6e828a4f4"
    description = "This is RHEL devops practice ami"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
    description = "This is instance type"
}

variable "env" {
    type = list
    default = ["dev","qua","prd"]
    description = "This is for environments"
}





