# Cloud-Init Terraform Assignment 🚀
Objective:
Use Terraform to automate an EC2 deployment with cloud-init.

Requirements
- main.tf with AWS provider, EC2 resource, and security group
- variables.tf for inputs
- outputs.tf for instance details
- cloud-init.yaml to configure software on boot (NGINX in this case)
- Fully automated EC2 instance deployment with no manual configuration

## Process 👣
1. Created the project folder and files

```text
terra-cloud/
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars    
└── cloud-init.yaml
```

2. Defined variables in variables.tf
- region, instance_type, ami, key_name, my_ip (optional)
- Default values were provided for region and instance type
- Sensitive data was set in terraform.tfvars

3. Configured cloud-init

- Created cloud-init.yaml to:
  - Update packages
  - Install and start NGINX
  - Enable NGINX on boot
- Passed the file to EC2 via user_data in main.tf:
  - user_data = file("${path.module}/cloud-init.yaml")

4. Configured the EC2 Security Group
- Opened HTTP (port 80) to all (0.0.0.0/0)
- Opened SSH (port 22) optionally restricted to my_ip
- Egress allowed all outbound traffic

5. Deployed the infrastructure

- terraform init
- terraform plan
- terraform apply

- Terraform created:
  - Security group
  - EC2 instance with cloud-init configuration
- Outputs displayed the public IP and DNS for accessing the NGINX site

6. Accessed the site

- Opened a browser at the instance’s public IP or DNS:
  - http://<instance_public_ip>

<img width="1914" height="1079" alt="Screenshot 2026-02-21 161934" src="https://github.com/user-attachments/assets/2002a473-87b4-4231-85b4-03b416bd7621" />


- NGINX landing page confirmed automated deployment worked
- Optional: SSH into the instance using the key pair if needed:
  - ssh -i ~/.ssh/<key>.pem ec2-user@<instance_public_ip>


## Key Takeaways 💡

- Learned how Terraform uses user_data to pass cloud-init for automatic provisioning
- Practiced structuring Terraform with:
  - Variables (variables.tf / terraform.tfvars)
  - Outputs (outputs.tf)
  - Security groups and EC2 resources
- Gained experience in fully automating software installation on boot

## Repo Notes 📝
- .terraform/, .tfstate, and terraform.tfvars are ignored in .gitignore to prevent committing sensitive data

- Cloud-init ensures EC2 instances are ready to use without manual steps

- For this project, modules were intentionally not used to keep the focus on demonstrating cloud-init automation and Terraform user_data functionality.

