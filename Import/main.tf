terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "class-2022-instance" {
    ami =  var.my-ami
    availability_zone = "us-east-1d"
    instance_type =  "t2.micro"

    security_groups = [
        "launch-wizard-7"
    ]
      
    subnet_id =  "subnet-09966813a021f53a0"
    tags =  {
        "Name": "Class-2022",
        "team": "kumba-ambozonia"
    }

    vpc_security_group_ids = [
        "sg-05b8a7f6fd3ac3272"
    ]         
         
}

resource "aws_s3_bucket" "mikes_bucket" {
  bucket =  "hashi-bucket-1308"
  tags = {
    Name = "amba"
  }
}