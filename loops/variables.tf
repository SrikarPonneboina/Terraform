variable "ami_id" {
    type = string
    default = "ami-0055977a6e828a4f4"
    description = "This is the ami-id"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
    description = "This is the instance type"
}


variable "environment" {
    type = list 
    #default = ["DEV", "QUA", "PRD"]
    description = "These are the environments"

validation {
  condition =  contains(["DEV", "QUA", "PRD"], var.environment)
  error_message = "The environment should be from the selected one DEV, QUA, PRD"
}
}

variable "instances" {
    type = list 
    default = ["mongodb","redis","mysql","rabbitmq","catalogue","user","cart","shipping","payment","frontend"]
    description = "These are the components for the roboshop project"
  
}
