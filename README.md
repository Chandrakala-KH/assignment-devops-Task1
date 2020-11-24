# Assignment-DevOps-Role
Repo is used to 
- Automatically provision Linux server on AWS using Terraform
- Install and configure nginx using Ansible Playbook

## Prerequisites
- AWS account needs to created
- Provision one server manually
- Install Terraform
- Install Ansible

  For Detailed instruction refer [Pre-requisites](https://github.com/chashakala/assignment-devops/blob/main/Pre-requisites/) file 
## Structure
```
├── README.md
├── Terraform
│   ├── variables.tf
│   ├── providers.tf
│   └── webservers.tf
├── Ansible
    ├── nginx.yml
    ├── inventory
    ├── ansible.cfg
    
 ```
 ## Execution steps
   Go to folder where Terraform files are stored and execute below commands
 - terraform init
 - terraform plan
 - terrafom apply
