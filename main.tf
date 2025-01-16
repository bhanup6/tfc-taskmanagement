provider "aws" {
    region = var.aws_region
}
resource "aws_instance" "appserver" {
    ami = var.ami_id
    instance_type = var.instance_type
    tags = {
      Name="Jenkins"
    }
  
}
resource "aws_security_group" "app_sg" {
  name        = "allow_web_traffic"
  description = "Allow inbound web traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}