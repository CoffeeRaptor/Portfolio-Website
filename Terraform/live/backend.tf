terraform {
  backend "s3" {
    bucket         = "shushanth-terraform-backend"
    key            = "portfolio-website/terraform.tfstate"
    region         = "eu-central-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}