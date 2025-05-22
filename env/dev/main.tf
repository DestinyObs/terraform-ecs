module "vpc" {
  source               = "../../modules/vpc"
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
  environment          = var.environment
  aws_region           = var.aws_region
  aws_access_key       = var.aws_access_key
  aws_secret_key       = var.aws_secret_key
}

module "security_groups" {
  source      = "../../modules/security_groups"
  environment = var.environment
  vpc_id      = module.vpc.vpc_id
  db_port     = var.db_port
}

module "ecr" {
  source      = "../../modules/ecr"
  environment = var.environment
}

module "secrets_manager" {
  source       = "../../modules/secrets_manager"
  secret_name  = "${var.environment}-rds-db-credentials"
  environment  = var.environment
  db_name      = var.db_name
  db_username  = var.db_username
  db_password  = var.db_password
  db_host         = module.rds.rds_endpoint
  db_port         = module.rds.rds_port
  api_url         = var.api_url
  api_golang_port = var.api_golang_port
  delay_ms        = var.delay_ms
}

module "rds" {
  source             = "../../modules/rds"
  environment        = var.environment
  aws_region         = var.aws_region
  db_name            = var.db_name
  db_username        = var.db_username
  db_password        = var.db_password
  db_instance_class  = var.db_instance_class
  allocated_storage  = var.allocated_storage
  multi_az           = var.multi_az
  subnet_ids         = module.vpc.private_subnet_ids
  vpc_id             = module.vpc.vpc_id
  aws_access_key     = var.aws_access_key
  aws_secret_key     = var.aws_secret_key
  vpc_security_group_ids = [module.security_groups.rds_sg_id]
}

module "alb" {
  source            = "../../modules/alb"
  environment       = var.environment
  public_subnet_ids = module.vpc.public_subnet_ids
  alb_sg_id         = module.security_groups.alb_sg_id
  vpc_id            = module.vpc.vpc_id
}

module "ecs" {
  source      = "../../modules/ecs"
  environment = var.environment
}

module "monitoring" {
  source      = "../../modules/monitoring"
  environment = var.environment
}