terraform {
  backend "s3" {
    bucket = "timi-bucket"
    region = "us-east-1"
    key = "my_jenkins_server/terraform.tfstate"
    profile = "terraform_user"
  }
}