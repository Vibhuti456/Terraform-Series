
## Day 5 - Terraform

### State Management in Terraform: Overview and Importance

Terraform uses state management to keep track of the infrastructure it manages. This state is stored in a file called terraform.tfstate, which acts as the single source of truth for your deployed infrastructure. 

### Roles and Importance of State Management

#### Tracks Real Infrastructure

Terraform state maps your configuration to the actual infrastructure in the cloud. It records resource attributes such as IDs, IPs, and metadata. Without state, Terraform wouldn’t know what already exists or needs to be changed.

#### Detects Drift
Terraform can detect when infrastructure has been changed outside of Terraform (e.g., manually in AWS) by comparing the state file to the actual live resources.

#### Enables Resource Dependencies
Terraform uses the state to understand resource relationships, enabling it to create, update, or destroy resources in the correct order.

Here are the most important Terraform state-related commands, along with what they do:

1. terraform state list 
Purpose: Lists all resources in the current state file.
```
terraform state list
```
2. terraform state show
Purpose: Displays detailed information about a single resource in the state.
```
terraform state show aws_instance.my_ec2
terraform state show 'aws_instance.my_ec2["EC2_INSTANCE1"]'
```
3. terraform state refresh 
Purpose: Syncs the state file with real infrastructure, detecting any drift.
```
terraform refresh
```
4. terraform state rm 
Purpose: Removes a resource from state without destroying it.
```
terraform state rm aws_key_pair.mykey
```
5. terraform import
Purpose: Brings an existing cloud resource into Terraform's state.
```
terraform import aws_key_pair.my_key ec2_terra_key
```

