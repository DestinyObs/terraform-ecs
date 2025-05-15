terraform {
  backend "s3" {
    bucket = "terraform-state-bucket-dev" 
    key    = "terraform/dev/terraform.tfstate"
    region = "us-east-1" 
  }
}
