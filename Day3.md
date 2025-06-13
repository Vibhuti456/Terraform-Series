
## Day 3 - Terraform

### What is providers in Terraform - 

A provider is a plugin that Terraform uses to interact with APIs of external platforms (like AWS, Azure, Google Cloud, GitHub, Kubernetes, etc.).

Providers allows terraform to create and manage resources in specific cloud and services.

### Why Providers Matter

Terraform by itself doesn’t know how to create a virtual machine or a database. Providers bridge the gap between your Terraform configuration and the platform you're working with.

##### Example

```
provider "aws" {
  region  = "us-west-2"
}
```

This tells Terraform:
1. Use the AWS provider
2. Deploy resources in the us-west-2 region

### How to install aws provider in your system

```
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0-beta3"
    }
  }
}
```

#### String Interpolation in Terraform

String interpolation in Terraform is a way to insert dynamic values inside strings using variables, expressions, or resource attributes. It allows you to build flexible and readable configurations.

```
resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}

output "instance_id" {
  value = "The instance ID is ${aws_instance.web.id}"
}
```

