terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 6.0"
    }
  }
}

provider "aws" {
    region = "us-east-1"
  
}

# terraform { requirequired_providers { aws = { source = "hashicorp/aws" version = "~>6.0" }}}
# provider "aws" { region = "us-east-1"}


# terraform {
#     required_providers {
#       aws = {
#         source = "hasicorp/aws"
#         version = "~> 6.0"
#       }
#     }
# }

# provider "aws" {
#     region = "us-east -1"
  
# }