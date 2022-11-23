terraform {
  
  backend "s3" {
    bucket         = "devops-directive-tf-netbiz" # REPLACE WITH YOUR BUCKET NAME
    key            = "backend/import-bootstrap/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}