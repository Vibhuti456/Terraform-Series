resource "aws_key_pair" "terra-key" {
  key_name = "${var.name_resource}-terra-ec2-key"
  public_key = file("terra-key-ec2.pub")

  tags = {
    Name = "${var.name_resource}-terra-key-ec2"
    Environment = var.env
  }
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/24"
  instance_tenancy = "default"

  tags = {
    Name = "${var.name_resource}-vpc-ec2"
    Environment = var.env
  }
}

resource "aws_subnet" "subnet" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.name_resource}-subnet"
    Environment = var.env
  }
}

resource "aws_security_group" "security" {
  name = "${var.name_resource}-asg"
  description = "this will generates the security groups"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP Access"
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH Open"
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Open All Access"
  }

  tags = {
    Name = "${var.name_resource}-asg"
    Environment = var.env
  }
}

resource "aws_instance" "ec2-server" {
  count = length(var.instance_count)
  depends_on = [ aws_key_pair.terra-key,aws_security_group.security ]

  key_name = aws_key_pair.terra-key.key_name
  vpc_security_group_ids = [aws_security_group.security.id]
  subnet_id = aws_subnet.subnet.id
  instance_type = var.instance_type
  ami = var.ami_ec2_id

  root_block_device {
    volume_size = var.volume_storage
    volume_type = "gp3"
  }

  tags = {
    Name = var.instance_count[count.index] 
    Environment = var.env
  }

}
