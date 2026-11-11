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

variable  "instance_type" {
  type        = map 
  default     = {
    dev = "t3.micro"
    uat = "t3.small"
    prd = "t8i.micro"
  }
  # validation {
  #   # Returns true if var.enviroinstance_typenment is one of the items in the list
  #   condition     = contains(["t3.micro", "t3.small", "t3.medium", "t3.large"], var.instance_type)
  #   error_message = "Instance type must be one of t3.small, t3.micro, t3.medium or t3.large."
  # }
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
