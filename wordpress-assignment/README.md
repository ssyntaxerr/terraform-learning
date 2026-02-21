# WordPress Assignment 📃

Objective:
Use Terraform to deploy a full WordPress stack on AWS.

Requirements
- main.tf with AWS provider, EC2 resource and required settings
- variables.tf for inputs
- outputs.tf for instance details
- User data script embedded or referenced
- A successful WordPress installation


## Process 👣

1. Created all necessary files and directories

```text
main.tf
variables.tf
outputs.tf
terraform.tfvars

modules/
│
├── ec2-module/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── user-data.sh
│
└── sg-module/
    ├── main.tf
    ├── variables.tf
    └── outputs.tf
```

2. Configured the AWS Provider
Configured the AWS provider inside main.tf, specifying:
- Region
- Required provider version
- EC2 instance configuration

Variables were abstracted into variables.tf to keep the configuration reusable and clean.

3. Built Modular Infrastructure
Created two reusable Terraform modules:

Security Group Module
- Allowed inbound HTTP (port 80) for public access
- Allowed inbound SSH (port 22) for remote administration
- Allowed all outbound traffic

EC2 Module
- Provisioned an EC2 instance
- Attached the Security Group
- Referenced a key pair for SSH access
- Used a user data script to automate WordPress setup

This modular approach improves:
- Reusability
- Maintainability
- Clean separation of concerns

4. Automated WordPress Installation

The user-data.sh script handled:

- System updates
- Apache installation
- PHP installation
- MySQL/MariaDB installation
- WordPress download and configuration

This ensured WordPress was automatically installed when the instance launched.

5. Initialized and Applied Terraform

Executed:
terraform init
terraform plan
terraform apply

Terraform provisioned:
- 1 EC2 instance
- 1 Security Group

The output displayed the public IP address, which was used to access the WordPress setup page via browser.

6. Verified Public Endpoint

After deployment:
- Accessed the EC2 public IP in a browser
- Confirmed the WordPress installation screen loaded
- Verified that the infrastructure was publicly reachable

<img width="1918" height="1079" alt="Screenshot 2026-02-19 205635" src="https://github.com/user-attachments/assets/2df2b6b6-cd2f-4612-a7cb-a17e90c70491" />

This satisfied the requirement for a working public endpoint.

7. Destroyed Infrastructure

After verification, ran:
terraform destroy

This ensured:
- No unnecessary AWS costs
- Infrastructure remained reproducible via code

## Key Learnings 📚
- Importance of modular Terraform design
- Managing file paths correctly with path.module
- Handling key pairs and AWS authentication
- Understanding Terraform state management
- The relationship between infrastructure code and actual deployed resources
