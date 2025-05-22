# ALB Module

## Overview
Creates an Application Load Balancer, target groups, and listener.

## Inputs
- `environment`
- `public_subnet_ids`
- `alb_sg_id`
- `vpc_id`

## Outputs
- `alb_arn`
- `frontend_tg_arn`
- `node_api_tg_arn`
- `go_api_tg_arn`