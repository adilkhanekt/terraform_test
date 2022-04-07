terraform {
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  required_version = ">= 0.14.9"
}


resource "aws_instance" "app_server" {
  ami           = "ami-04505e74c0741db8d"
  instance_type = "t2.micro"
  subnet_id = "subnet-09844f759201f5443"

  tags = {
    Name = var.instance_name
  }
}
