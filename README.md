# Assignment-DevOps-Role
This Repo is used to 
- Automatically provision Linux server on AWS using Terraform
- Install and configure nginx using Ansible Playbook

## Prerequisites
- AWS account needs to be created
- Provision one server manually to run Terraform 
     - Install Terraform
     - Install Ansible
  For Detailed instruction refer [Pre-requisites](https://github.com/chashakala/assignment-devops/blob/main/Pre-requisites/) file 
## Files 
```
├── README.md
├── variables.tf
├── providers.tf
├── webservers.tf
├── nginx.yml
├── inventory
├── ansible.cfg
 ```

### CONFIGURATION
Server where terraform and asnible instaleld:
[root@terraform ec2-user]# ls
epel-release-latest-7.noarch.rpm  invent.ini   linuxkey.pem  providers.tf       terraform.tfstate.backup
index.html                        k8s-cluster  main.tf       terraform.tfstate  test
[root@terraform ec2-user]# cd /etc/ansible/
[root@terraform ec2-user]# ls
ansible.cfg  hosts  index.html  inventory  nginx.yml  roles

 ## Execution steps
   Login to server
   Go to folder where Terraform files are stored and execute below commands
 - terraform init
 - terraform plan
 - terrafom apply
 
 ### Validation
    Login to server which is provisioned using above terraform code
    curl localhost:80
    or
    Browse https://ip:80
     You will see "Hellow world" message

