# Security Groups Module

## Overview
Creates security groups for ALB, ECS, and RDS with correct ingress/egress rules.

## Inputs
- `environment`
- `vpc_id`
- `db_port`

## Outputs
- `alb_sg_id`
- `ecs_sg_id`
- `rds_sg_id`