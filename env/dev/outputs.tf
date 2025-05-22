output "rds_endpoint" {
  value = module.rds.rds_endpoint
}

output "rds_port" {
  value = module.rds.rds_port
}

output "frontend_ecr_repo_url" {
  value = module.ecr.frontend_repo_url
}

output "alb_arn" {
  value = module.alb.alb_arn
}

output "ecs_cluster_id" {
  value = module.ecs.ecs_cluster_id
}

output "db_secret_arn" {
  value = module.secrets_manager.db_secret_arn
}