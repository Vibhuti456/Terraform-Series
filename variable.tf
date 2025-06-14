variable "ec2_instance_type" {
  default = "t2.micro"
  type = string
}

variable "ec2_root_storage_size" {
    default = 8
    type = number
}

variable "ec2_ami_id" {
    default = "ami-0d1b5a8c13042c939"
}
