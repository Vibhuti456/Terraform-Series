
# Terraform 

## Day1 

### Terraform 
Terraform is a open source infrastructure tool(IAC) developed by HashiCorp that allows you to define, provision and manage cloud infrastructure using declarative confriguration language.

### Simple Term 
Terraform lets you write code to build and manage your infrastructure like - databases, servers, networks instead of doing manually. 

## Why IAC Matters
Infrastructure as code is a revolutionary approach to managing IT infrastructure by treating it like a software - written in code, stored in version control and deployed automatically. 

#### Consistency & Repeatability
1. manual confriguration is prone to human error. 
2. with IAC environments like dev, prod, test are identical every time you deploy.


#### Automation & Speed 
1. Infrastructure can be provisioned in seconds or minutes, not hours or days.
2. Great for CI/CD pipelines and DevOps practices.

#### Version Control & Auditing

1. Infrastructure changes are stored in Git (or other VCS).
2. You can track who changed what, when, and why.
3. Easy rollback to previous versions if something breaks.

#### Collabration 
1. Teams work on infrastructure like code — using pull requests, code reviews, and branches.
2. Reduces confusion and increases shared understanding.

#### Scalability
1. Easily scale infrastructure up/down by changing a few lines of code.
2. Supports auto-scaling, load balancing, and disaster recovery setups.

## Terraform VS Ansible

1. Terraform is primarily an Infrastructure as Code (IaC) tool used for provisioning and managing cloud infrastructure. It allows you to define resources such as virtual machines, networks, load balancers, and databases using a declarative language called HCL (HashiCorp Configuration Language).

2. Terraform keeps track of infrastructure state, enabling consistent and repeatable deployments across environments. It's particularly powerful in multi-cloud environments, supporting providers like AWS, Azure, and Google Cloud, and excels at managing infrastructure at scale.

3. On the other hand, Ansible is a configuration management and automation tool used to configure systems, install software, and manage services on already provisioned infrastructure. It uses YAML to write playbooks and operates in a mostly procedural manner.

4. Ansible is agentless, relying on SSH (or WinRM on Windows), and is great for tasks like installing packages, updating configuration files, and managing application deployments. Unlike Terraform, Ansible does not maintain a state file by default, meaning it executes tasks as instructed without necessarily tracking what’s already been applied.

A common DevOps workflow involves using Terraform to set up the infrastructure (e.g., launching a virtual machine on AWS), and then using Ansible to configure that machine (e.g., installing NGINX or setting up firewall rules). Thus, instead of choosing one over the other, many teams use both tools together—Terraform to build it, Ansible to configure it.

### Installation of Terraform in Linux

1. Update the system and install the gnupg software
```
 sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
``` 

2. Install the HashiCorp GPG key.
``` 
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
``` 

3. Verify the key's fingerprint.
``` 
gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint
``` 
4. The gpg command will report the key fingerprint:
```
/usr/share/keyrings/hashicorp-archive-keyring.gpg
-------------------------------------------------
pub   rsa4096 XXXX-XX-XX [SC]
AAAA AAAA AAAA AAAA
uid           [ unknown] HashiCorp Security (HashiCorp Package Signing) <security+packaging@hashicorp.com>
sub   rsa4096 XXXX-XX-XX [E]
```
5. Add the official HashiCorp repository to your system.
```
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
``` 

6. Download the package information from HashiCorp.
```
sudo apt update
```

7. Install Terraform from the new repository.
```
sudo apt-get install terraform
```

8. Check Terraform Version
```
terraform --version
```

