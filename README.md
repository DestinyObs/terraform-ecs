# AWS ECS Microservices Infrastructure with Terraform

## Overview

This repository provides a modular, production-ready Terraform setup for deploying a secure, scalable AWS infrastructure for containerized microservices.  
It is designed for teams building with ECS Fargate, RDS PostgreSQL, and modern DevOps best practices.

---

## Project Structure

```plaintext
.
├── env/
│   └── dev/
│       ├── backend.tf         # Remote state backend config (S3)
│       ├── main.tf            # Main environment configuration
│       ├── outputs.tf         # Environment outputs
│       ├── providers.tf       # AWS provider config
│       ├── terraform.tfvars   # Environment variables (DO NOT COMMIT SECRETS)
│       └── variables.tf       # Variable definitions
├── modules/
│   ├── alb/                   # Application Load Balancer (ALB)
│   ├── ecr/                   # Elastic Container Registry (ECR)
│   ├── ecs/                   # ECS Cluster (Fargate)
│   ├── monitoring/            # CloudWatch logs and alarms
│   ├── rds/                   # RDS PostgreSQL
│   ├── secrets_manager/       # AWS Secrets Manager
│   ├── security_groups/       # All security groups
│   └── vpc/                   # VPC, subnets, NAT, IGW, routing
├── .gitignore
└── README.md                  
```

---

##  What’s Implemented

- **VPC Module:**  
  Custom VPC, public/private subnets, NAT, IGW, route tables, outputs for subnet IDs.

- **Security Groups Module:**  
  SGs for ALB (HTTP/HTTPS), ECS (from ALB), RDS (from ECS).

- **ECR Module:**  
  Four ECR repos: frontend, node API, go API, load generator.

- **RDS Module:**  
  PostgreSQL, Multi-AZ, encrypted, private subnets, uses SG from SG module, credentials in Secrets Manager.

- **Secrets Manager Module:**  
  Stores DB credentials (username, password, dbname).

- **ECS Module:**  
  ECS cluster created (task/service definitions to be added).

- **ALB Module:**  
  ALB in public subnets, target groups for frontend, node API, go API, default listener.

- **Monitoring Module:**  
  CloudWatch log group for ECS, CPU alarm (extend for memory, DB, dashboards).

---

## What’s Next

- **ECS Task Definitions & Services:**  
  - Define tasks for frontend, node API, go API, load generator.
  - Wire services to ALB target groups.
  - Add auto-scaling policies.

- **ALB Listener Rules:**  
  - Route `/api-node`, `/api-go`, `/` to correct target groups.

- **Monitoring Enhancements:**  
  - Add alarms for memory, DB connections.
  - Create CloudWatch dashboards for ECS, RDS, ALB.

- **Secrets Expansion:**  
  - Store API keys and environment variables as needed.

- **Production Hardening:**  
  - Use SSM Parameter Store or Secrets Manager for all secrets.
  - Enable deletion protection, final snapshot for RDS in prod.
  - Add lifecycle policies to ECR.

---

## Usage

### Prerequisites

- [Terraform](https://www.terraform.io/downloads)
- AWS CLI configured with appropriate credentials
- S3 bucket for remote state (see `env/dev/backend.tf`)

### Deployment Steps

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

---

## Notes & Best Practices

- **Never commit real AWS credentials or secrets.** Use environment variables or AWS profiles.
- **Review costs** before applying: NAT Gateway, RDS Multi-AZ, and ALB can be expensive.
- **Check AWS region and quotas** for your account.
- **Remote state:** Make sure your S3 backend bucket exists and is accessible.
- **Sensitive data:** Use `terraform.tfvars` for secrets, but prefer referencing from Secrets Manager in production.
- **Extend modules** as your microservices architecture grows.

---

## 👤 Author

**Destiny Obueh**  
[GitHub: @DestinyObs](https://github.com/DestinyObs)

---

**iDeploy | iSecure | iSustain**
