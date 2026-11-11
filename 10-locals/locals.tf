locals {
  instance_type = "t3.micro"
  name = "${var.project}-${var.environment}"
  common_tags = {
    project = "${var.project}"
    Environment = "${var.environment}"
    Terraform = "true"
  }
  ec2_tags = merge(
    local.common_tags,
    {
        Name = "${var.project}-${var.environment}"
    }
  )
}