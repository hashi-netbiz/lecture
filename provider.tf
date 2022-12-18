terraform {  
  # backend "s3" {
  #   bucket         = "devops-directive-tf-netbiz" # REPLACE WITH YOUR BUCKET NAME
  #   key            = "backend/import-bootstrap/terraform.tfstate"
  #   region         = "us-east-1"
  #   dynamodb_table = "terraform-state-locking"
  #   encrypt        = true
  # }

  # backend "remote" {
  #   hostname = "app.terraform.io"
  #   organization = "example-org-2c0f83"

  #   workspaces {
  #     name = "dev-env"
  #   }
  # }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.74.2"
    }
  }
}

