terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  required_version = ">= 0.14.9"
}

module "ec2-module" {
  source = "./modules/ec2/"
}