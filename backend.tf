terraform {
  backend "s3" {
    bucket         = "iti-bucket-164-terraform"
    key            = "iti/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "backend"
  }
}