# Dev Environment

## Overview

This directory contains the environment-specific Terraform configurations for the development (`dev`) environment. It includes the setup for the VPC module and the backend state configuration.

### Current Modules Implemented:

* **VPC Module:** Creates the VPC, public and private subnets, and assigns availability zones.

### Upcoming Modules:

* RDS Module (PostgreSQL Database)
* ECR Module (Elastic Container Registry)
* ECS Module (Fargate Cluster)
* Secrets Manager Module

## Directory Structure

```
/env/dev/
├── backend.tf   # Backend configuration for S3 state
├── main.tf      # Main Terraform configuration for the environment
└── variables.tf # Environment-specific variables
```

## Deployment Steps

1. Navigate to the `env/dev` directory:

   ```bash
   cd env/dev
   ```

2. Initialize Terraform:

   ```bash
   terraform init
   ```

3. Review the execution plan:

   ```bash
   terraform plan
   ```

4. Apply the changes:

   ```bash
   terraform apply
   ```

### Notes

* Ensure that the AWS credentials are configured before running the commands.
* The backend state is stored in the S3 bucket defined in `backend.tf`.
