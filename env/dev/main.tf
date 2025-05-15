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
