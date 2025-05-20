# VPC Module

## Overview
This module creates the Virtual Private Cloud (VPC) infrastructure, including:
- VPC
- Public and Private Subnets
- Availability Zones

## Inputs
- `vpc_cidr`: The CIDR block for the VPC.
- `public_subnet_cidrs`: List of public subnet CIDR blocks.
- `private_subnet_cidrs`: List of private subnet CIDR blocks.
- `availability_zones`: Availability zones for the subnets.
- `environment`: Environment name (e.g., dev, prod).

## Outputs
- `vpc_id`: The ID of the created VPC.
- `public_subnet_ids`: List of public subnet IDs.
- `private_subnet_ids`: List of private subnet IDs.
