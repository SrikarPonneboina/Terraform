terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  # backend "s3" {
  #   bucket       = "my-terraform-state-bucket"
  #   key          = "prod/terraform.tfstate"
  #   region       = "us-east-1"
  #   encrypt      = true
  #   use_lockfile = true # Built-in S3 state locking
  # }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
