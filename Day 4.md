
## Day 4 - Terraform

### Blocks in Terraform

1. output block 
2. variable block 
3. resource block 

#### Output block

Used to display values after Terraform execution (e.g., public IPs, IDs).

Example

```
output "ec2_instance_ip"{
    value = aws_instance.myinstance.public_ip
}
```
You can see outputs with:
```
terraform output
```
#### Output with for_each meta Argument - 
```
for_each {
    value = for key in aws_instance.myinstance : key.public_ip
}
```

#### Variable block

Used to define inputs so your configuration is flexible and reusable.

Example

```
variable "ec2_instance_type"{
    default = "t2.micro"
    type = string
}

variable "ec2_ami_id"{
    default = "ami-0d1b5a8c13042c939"
    type = string
}
```

#### Variable using for_each meta Argument
```
variable "env" {
   default = "prd"
   type = string 
}

resource "root_block_size" {
    volume_size = var.env == "prd" ? 20 : 10
    volume_type = "gp3" 
}
``` 

#### Resource block
Defines actual infrastructure to create (EC2, S3, VPC, etc.)

Example

```
resource "aws_instance" "myinstance"{
    instance_type = "t2.micro"
    ami = "ami-0d1b5a8c13042c939"
}
```
### Meta Arguments - 
In Terraform, meta-arguments are special arguments that modify the behavior of a resource block, but do not represent resource properties. They are handled directly by Terraform and apply to how the resource is managed, not what the resource is.

1. count 
2. for_each
3. depends_on

#### Count -
Used to create multiple copies of a resource by index.

Example

```
resource "aws_instance" "myinstance"{
    count = 2
    instance_type = "t2.micro"
    ami = "ami-0d1b5a8c13042c939"
}
```

It creates two copies of EC2 instances.

#### for_each - 
Used to create multiple resources using a map or set of strings, with custom keys instead of indexes.

Example

```
resource "aws_instance" "myinstance"{
    for_each = tomap ({
     "EC2_instance_1" = "t2.micro"
     "EC2_instance_2" = "t2.micro"
    })
    instance_type = each.value
    ami = "ami-0d1b5a8c13042c939"
}

tags = {
    Name = each.key
}
```

#### depends_on - 
Used to explicitly define dependencies between resources.

Example 

```
depends_on ["aws_security_groups.mygroup", "aws_key_pair.mykey]
```

### Conditional Expression
In Terraform, a conditional expression is used to assign a value based on a condition—similar to an if-else statement in programming.

It helps make your configurations dynamic and flexible.

##### Basic Syntax
```
condition ? true_value : false_value
```
Example

```
resource "root_block_size" {
    volume_size = var.env == "prd" ? 20 : 10
    volume_type = "gp3" 
```

