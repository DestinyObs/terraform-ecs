module "vpc" {
  source             = "./modules/vpc"
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

resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-state-bucket-${var.environment}"  # Ensure uniqueness

  tags = {
    Name        = "Terraform State Bucket"
    Environment = var.environment
  }
}

resource "aws_s3_bucket_versioning" "state_versioning" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}
