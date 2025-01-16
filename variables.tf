variable "aws_region" {
    default = "us-east-1"
  
}
variable "ami_id" {
  default = "ami-05576a079321f21f8"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "security_group_id" {
    type = string
    default = "null"
  
}