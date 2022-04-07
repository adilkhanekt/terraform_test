variable "instance_ami" {
  description = "Value of the AMI used for the EC2 instance"
  type        = string
  default     = "ami-04505e74c0741db8d"
}

variable "subnet_id" {
  description = "Value of the subnet id used for the EC2 instance"
  type        = string
  default     = "subnet-09844f759201f5443"
}

variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "TheFastestManAlive"
}
