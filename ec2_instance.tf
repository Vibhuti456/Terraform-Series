#key_pair
resource "aws_key_pair" "deployer"{
    key_name = "terra-key-ec2"
    public_key = file("terra-key-ec2.pub")
}

#vpc and security groups
resource "aws_default_vpc" "default"{

} 

#security groups
resource "aws_security_group" "mysg"{
    name = "automate_sg"
    description = "this will add a TF generated security group"
    vpc_id = aws_default_vpc.default.id     #interpolation

    #inbound rules
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "SSH Open"
    }
    ingress {
         from_port = 80
         to_port = 80
         protocol = "tcp"
         cidr_blocks = ["0.0.0.0/0"]
         description = "HTTP Open"
    }
    #outbound rules
    egress {
       from_port = 0
       to_port = 0
       protocol = "-1"
       cidr_blocks = ["0.0.0.0/0"]
       description = "All Access"
    }

    tags = {
      name = "automate_sg"
    }
}

#ec2 instance
resource "aws_instance" "ec2_instance" {
    key_name = aws_key_pair.deployer.key_name
    security_groups = [aws_security_group.mysg.name]
    instance_type = "t2.micro"
    ami = "ami-0d1b5a8c13042c939"

    root_block_device {
      volume_size = "8"
      volume_type = "gp3"
    }
  
    tags = {
      name = "Terraform-ec2"
    }
}
