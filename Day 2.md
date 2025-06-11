
## Day 2 - Terraform

### Terraform HCL 

HCL (HashiCorp Configuration Language) is the domain-specific language used by Terraform to define infrastructure as code. It's designed to be human-readable, concise, and declarative, which makes it ideal for describing infrastructure components in a clear and structured way.

### Why HCL - 

1. Easy to Read – Looks like JSON but simpler and more readable.

2. Declarative – You describe what you want, not how to do it.

3. Flexible – Supports variables, functions, conditionals, and loops (with for_each, count, dynamic blocks, etc.)


#### Basic Syntax of HCL - 

``` 
<block> <label1> <label2> {
     // arguments
}
``` 

1. Block - Blocks are the containers where defining the providers, resources, resources type, resource name, module and other Configuration elements. 

```
resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}
``` 

resource ----> block 

aws_instance ---> resource type

web ----> resource name (identifier)

2. Arguments - Arguments are the key-value pair within a block where defining the Configuration details for the block to execute.

```
instance_type = "t2.micro"
``` 
instance_type ---> arguments

t2.micro ----> value

Arguments control how the block behaves.

3. Parameter - A parameter is a value assign to the arguments.

```
region = "us-west-2"
``` 

Here, "us-west-2" is the parameter assigned to the region argument.

### First Terraform file - 

It will create a automate.txt file with a specific content.

``` 
resource local_file myfile {
    filename = "automate.txt"
    content = "This is automate file created by Terraform tool" 
}
``` 

### Wokflow and Execution 

How to apply a Terraform file and make it execute your first file.

#### Following Commands to execute .tf file

#### Terraform Init - 

Initializes a Terraform working directory.

What it does:
1. Downloads required provider plugins (e.g., AWS, Azure)
2. Initializes the backend (for remote state storage)
3. Sets up the .terraform/ directory
```
terraform init
``` 

Must be run before any other commands in a new or updated project.

#### Terraform Plan - 

Generates an execution plan.

What it does:

1. Compares the current state with your configuration
2. Shows what Terraform will do (add/change/destroy)
3. Helps prevent surprises before applying changes
```
terraform plan
``` 

#### Terraform Validate - 

Validates the syntax of your Terraform files.

What it does:

1. Checks .tf files for syntax errors
```
terraform validate 
```

#### Terraform Apply - 

Applies the changes required to reach the desired state.

What it does:

1. Executes the actions proposed in the plan
2. Provisions, updates, or deletes resources
```
terraform apply
``` 

You’ll be prompted to confirm before it executes (use -auto-approve to skip prompt).

``` 
terraform apply -auto-approve
```

#### Terraform destroy - 

Destroys all resources managed by Terraform.

What it does:

1. Removes infrastructure defined in the state file
2. Useful for tearing down dev/test environments
``` 
terraform destroy
```
```
terraform destroy -auto-approve 
```






