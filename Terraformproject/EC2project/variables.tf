variable "instance_type" {
  default = "t2.micro"
  type = string
}

variable "ami_ec2_id" {
  default = "ami-0d1b5a8c13042c939"
  type = string
}

variable "volume_storage" {
  default = 8
  type = number
}

variable "env" {
  default = "dev"
  type = string
}

variable "name_resource" {
  default = "automated"
  type = string
}

variable "instance_count" {
  type = list(string)
  default = [ "instance-1", "instance-2" ]
}
