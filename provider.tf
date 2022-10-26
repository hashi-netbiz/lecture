terraform {
  required_version = ">= 1.3"  //latest terraform version
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.4.3"
    }
}
    backend "s3" {
        bucket = "hashi-bucket"
        key    = "testlocation"
        region = "us-east-1"
    }
}