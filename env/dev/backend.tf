terraform {
  backend "s3" {
    bucket = "xyz-ecs-terraform-state-bucket-dev" 
    key    = "env/dev/terraform.tfstate"
    region = "us-east-1" 
  }
}
