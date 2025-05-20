
# AWS Infrastructure Deployment with Terraform

This repository contains Terraform configurations for provisioning a modular and scalable infrastructure on AWS. It includes a VPC, an RDS PostgreSQL database, and placeholders for ECS and Secrets Manager modules.

## Project Structure

```bash
.
├── .gitignore
├── README.md
├── env
│   └── dev
│       ├── backend.tf
│       ├── main.tf
│       ├── outputs.tf
│       ├── providers.tf
│       ├── terraform.tfvars
│       └── variables.tf
└── modules
    ├── ecs/                 # ECS (To be implemented)
    ├── rds/                 # RDS PostgreSQL DB setup
    ├── secrets/             # Secrets (To be implemented)
    ├── secrets_manager/     # AWS Secrets Manager (To be implemented)
    └── vpc/                 # VPC with public and private subnets
````

## Features

### Implemented

* **VPC Module**

  * Public and private subnets across two availability zones
  * Custom CIDR blocks
* **RDS Module**

  * PostgreSQL engine
  * Subnet group and security group
  * Private networking

### To Do

* **ECS Module**

  * Fargate cluster
  * Task definitions and service
* **Secrets/Secrets Manager Module**

  * Secure storage of environment secrets
  * IAM integration for access

## Prerequisites

* [Terraform](https://www.terraform.io/downloads)
* AWS CLI configured with appropriate credentials
* AWS account with permissions to provision VPC, RDS, and related resources

## Getting Started

1. **Clone the repository**

   ```bash
   git clone https://github.com/DestinyObs/terraform-ecs.git
   cd terraform-ecs/env/dev
   ```

2. **Initialize Terraform**

   ```bash
   terraform init
   ```

3. **Preview the Execution Plan**

   ```bash
   terraform plan
   ```

4. **Apply the Configuration**

   ```bash
   terraform apply
   ```

5. **Destroy the Infrastructure (when done)**

   ```bash
   terraform destroy
   ```

## Secrets Management (Coming Soon)

The `secrets_manager` module will be integrated to securely store and retrieve secrets (e.g., database credentials, API tokens) using AWS Secrets Manager.

## ECS Deployment (Coming Soon)

The `ecs` module will be used to containerize and deploy applications using AWS ECS with Fargate, load balancers, and service discovery.

## Notes

* Keep your Terraform backend secure and configure it for remote state storage in `backend.tf`.
* Use `terraform.tfvars` to inject sensitive values during runtime. Avoid hardcoding credentials.

## Author

**Destiny Obueh**
[GitHub: @DestinyObs](https://github.com/DestinyObs)

---

**iDeploy | iSecure | iSustain | iDoNotCopy**

=