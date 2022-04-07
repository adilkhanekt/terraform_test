resource "aws_instance" "app_server" {
  ami            = "ami-04505e74c0741db8d"
  instance_type  = "t2.micro"
  subnet_id      = "subnet-09844f759201f5443"
  tags = {
    Name = "WayneCorp"
  }
}