module "vpc" {
  source   = "../../modules/vpc"
  providers = {
    aws = aws
  }
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones = var.availability_zones
  environment        = var.environment
  aws_region        = var.aws_region
}

module "rds" {
  source         = "../../modules/rds"
  environment    = var.environment
  aws_region     = var.aws_region
  db_name        = var.db_name
  db_username    = var.db_username
  db_password    = var.db_password
  db_instance_class = var.db_instance_class
  allocated_storage = var.allocated_storage
  multi_az       = var.multi_az
  subnet_ids     = module.vpc.private_subnet_ids
  vpc_id         = module.vpc.vpc_id
}
