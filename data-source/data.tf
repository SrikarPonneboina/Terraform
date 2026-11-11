data "aws_ami" "joindevops" {   #searching ami-id in the provider aws with aws_ami, the ami is releated to joindevops
    most_recent = true          # i need most recent one from the ami
    owners = [ "973714476881" ] # this is the owner id

    filter {                    # here we can use filters to filter the ami_id
      name = "name"             # name
      values = [ "Redhat-9-DevOps-Practice" ]   # name of ami-id
    }
    
    filter {
      name = "virtualization-type"
      values = [ "hvm" ]
    }
}

output "ami_id" {                   # printing the output of the ami-id
  value = data.aws_ami.joindevops.id        #values from data.aws_ami and from joindevops data
}