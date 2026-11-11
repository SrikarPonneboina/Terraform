variable "ami_id" {
    type = string
    default = "ami-0055977a6e828a4f4"
    description = "This is RHEL DevOps practice ami"
}

variable "instance_type" {
    type = string
    #default = "t3.micro"
    description = "this is instance t3.micro"

    validation {
        # Returns true if var.environment instance_type is one of the items in the list
      condition = contains(["t3.micro", "t3.small", "t3.medium", "t3.large"], var.instance_type)
      error_message = "Instance type must be one of t3.micro, t3.small, t3.medium, t3.large"
    }
}

variable "environment" {
    type = list(string)
    default = [ "dev", "qua", "prd" ]
    description = "This are environments"
  
}

variable "ec2_tags" {
    type = map(string)
    default = {
      "Name" = "roboshop-mongodb"
      "project" = "roboshop"
      "managed-by" = "terraform"
    }
}

variable "cidr_blocks" {
    type = list
    default = [ "0.0.0.0/0" ]
}

variable "from_port" {
    type = number
    default = 0
}