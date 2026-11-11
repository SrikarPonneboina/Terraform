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