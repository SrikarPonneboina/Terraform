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
variable "project" {
    type = string
    default = "roboshop"
}

variable "environment" {
  type        = list(string)
  default     = ["dev", "qua", "prd"]
  description = "The target deployment environment (DEV, QUA, or PRD)"

#   validation {
#     condition     = contains(["DEV", "QUA", "PRD"], var.environment)
#     error_message = "The environment must be one of: DEV, QUA, PRD."
#   }
}

variable "instances" {
    type = list 
    default = ["mongodb","redis","mysql","rabbitmq","catalogue","user","cart","shipping","payment","frontend"]
    description = "These are the components for the roboshop project"
  
}

variable "hostedzone_id" {
    default = "Z064550534ZXEXGIQB3I4"
}

variable "domain_name" {
    default = "sriakarlabs.space"
}
