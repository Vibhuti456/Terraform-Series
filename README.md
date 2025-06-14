# How to Execute Terraform File

In this repository i added couple of files used in creating EC2 instance on aws cloud.

1. terraform.tf (containing the configuration of installing the resources or services like AWS)
2. provider.tf (configuration on AWS)
3. ec2_instance.tf (automate the task of creating an EC2 instance on AWS cloud)
4. outputs.tf (Used output resource to display few things related to AWS on screen like IP address)
5. variable.tf (Used variable resource to make our main terraform more clean and readable by using variable and reuse them at any time)
6. install_nginx.sh (Install the nginx web server on the instance when it create first time)

### Steps to Execute .tf file

Once all files are ready then follow below commands:

```
terraform init  
``` 
It will intialize the environment of AWS on your local server to execute all AWS services.

```
terraform validate
```
It will validate all .tf files and gives a message of success if there is no syntax error in the files. 

```
terraform plan
```
It will create a plan of the execution like what terraform will do by using the main file or it a plan which terraform going to execute contains all the details.

```
terraform apply
```
It will create a EC2 instance on your AWS cloud, we can see the console of AWS cloud after executing this command. Our EC2 instance will be created.

```
terraform destroy
```
It will destroy all the components of AWS EC2 instance created. 

##### Nginx Web Page Installed by using Terraform 

<img width="958" alt="nginx" src="https://github.com/user-attachments/assets/a9db41aa-0029-4f62-bf99-c802a8b14254" />
