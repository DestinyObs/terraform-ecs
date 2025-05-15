# terraform {
#   backend "s3" {
#     bucket = "terraform-state-bucket-dev"  # Must match the created bucket
#     key    = "terraform/dev/terraform.tfstate"
#     region = "us-east-1"
#   }
# }
