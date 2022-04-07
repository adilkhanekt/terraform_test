terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.24.1"
    }
  }
  required_version = "~> 1.0"
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "web_app" {
  for_each               = local.security_groups
  ami                    = "ami-03e0b06f01d45a4eb"
  subnet_id              = "subnet-034de1ec4779ec3ee"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [each.value]
  user_data              = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF
  tags = {
    Name = "${var.name}-justice-${each.key}"
  }
}

resource "aws_security_group" "sg_ping" {
  name   = "Allow Ping"
  vpc_id = "vpc-02659d10b72b51bf9"
}

resource "aws_security_group_rule" "ping_rule" {
  type                     = "ingress"
  from_port                = -1
  to_port                  = -1
  protocol                 = "icmp"
  security_group_id        = aws_security_group.sg_ping.id
  source_security_group_id = aws_security_group.sg_8080.id
}

resource "aws_security_group" "sg_8080" {
  name   = "Allow 8080"
  vpc_id = "vpc-02659d10b72b51bf9"

}

resource "aws_security_group_rule" "http_rule" {
  type                     = "ingress"
  from_port                = -1
  to_port                  = -1
  protocol                 = "icmp"
  security_group_id        = aws_security_group.sg_8080.id
  source_security_group_id = aws_security_group.sg_ping.id
}

locals {
  security_groups = {
    sg_ping = aws_security_group.sg_ping.id,
    sg_8080 = aws_security_group.sg_8080.id,
  }
}
