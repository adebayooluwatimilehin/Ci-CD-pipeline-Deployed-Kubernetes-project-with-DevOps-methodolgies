terraform {
  backend "s3" {
    bucket = "timi-bucket"
    region = "us-east-1"
    key = "eks/terraform.tfstate"
    profile = "terraform_user"
  }
}