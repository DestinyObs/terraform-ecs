# resource "aws_s3_bucket" "terraform_state" {
#   bucket = "xyz-ecs-terraform-state-bucket-${var.environment}"

#   provider = aws  # Ensure correct provider reference

#   tags = {
#     Name        = "Terraform State Bucket"
#     Environment = var.environment
#   }
# }

# resource "aws_s3_bucket_ownership_controls" "state_bucket_ownership" {
#   bucket = aws_s3_bucket.terraform_state.id

#   rule {
#     object_ownership = "BucketOwnerEnforced"
#   }
# }

# resource "aws_s3_bucket_public_access_block" "state_bucket_public_access" {
#   bucket = aws_s3_bucket.terraform_state.id

#   block_public_acls       = true
#   block_public_policy     = true
#   ignore_public_acls      = true
#   restrict_public_buckets = true
# }

# resource "aws_s3_bucket_versioning" "state_versioning" {
#   bucket = aws_s3_bucket.terraform_state.id

#   versioning_configuration {
#     status = "Enabled"
#   }
# }


module "vpc" {
  source   = "../../modules/vpc"
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones = var.availability_zones
  environment        = var.environment
  aws_region        = var.aws_region
  aws_access_key    = var.aws_access_key
  aws_secret_key    = var.aws_secret_key
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
  aws_access_key = var.aws_access_key
  aws_secret_key = var.aws_secret_key
}
