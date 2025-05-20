# RDS Module

## Overview  
This module creates the RDS infrastructure, including:  
- RDS Instance  
- Security Group  
- Subnet Group  

## Inputs  
- `db_name`: Name of the database.  
- `db_username`: Database username.  
- `db_password`: Database password.  
- `instance_class`: RDS instance type (e.g., db.t3.micro).  
- `allocated_storage`: Storage size in GB.  
- `vpc_id`: The VPC ID where RDS will be deployed.  
- `subnet_ids`: List of subnet IDs for the RDS subnet group.  
- `environment`: Environment name (e.g., dev, prod).  

## Outputs  
- `rds_endpoint`: The endpoint of the RDS instance.  
- `rds_security_group_id`: The security group ID associated with the RDS instance.  
