
# # Create Random Pet Resource
resource "random_pet" "this" {
  length = 2
  prefix = "hashi" 
}

# Configure the AWS Provider
provider "aws" {
  # shared_credentials_file = "$HOME/.aws/credentials"
  # profile                 = "default"
  region                  = "us-east-1"
}

locals {
  ec2_key_name = random_pet.this.id
}
//Create a VPC
# resource "aws_vpc" "example" {
#   cidr_block = var.cidrBlock

#   tags = {
#     Name = "mytestvpc"
#   }
# }

module "our_class_vpc" {
  source = "./modules-class"

  cidr_block_hashi = var.cidrBlock
}


 resource "aws_subnet" "my_subnet" {
   #vpc_id            = aws_vpc.example.id
   vpc_id = module.our_class_vpc.vpc_id
   #cidr_block        = var.subnet_cidr
   cidr_block = "10.0.2.0/24"
   availability_zone = "us-east-1a"
   #availability_zone = data.aws_availability_zones.available.names[0]

   tags = {
     #Name = random_pet.this.id
     Name = "testing server"
     env = "testing"
     CAR = "BMW"
   }
 }

# data "aws_ami" "ubuntu" {
#     most_recent = true
 
#     filter {
#         name   = "name"
#         values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
#     }
 
#     filter {
#         name   = "virtualization-type"
#         values = ["hvm"]
#     }
 
#     filter {
#         name   = "architecture"
#         values = ["x86_64"]
#     }
# }

 resource "aws_instance" "web" { 
   ami           = var.local-ami
   instance_type = var.instanceTypes
   subnet_id     = aws_subnet.my_subnet.id
   key_name = "hashi"
 
   tags = {
     #Name = random_pet.this.id    
     Name = "test instance"
     type = var.alist[1]
     env = "test12"
   } 

     lifecycle {
    ignore_changes = [
      # Ignore changes to tags, e.g. because a management agent
      # updates these based on some ruleset managed elsewhere.
      tags,
    ]
  }
 }

resource "tls_private_key" "generated" {
  algorithm = "RSA"
}

resource "local_file" "private_key_pem" {
  content  = tls_private_key.generated.private_key_pem
  filename = "${local.ec2_key_name}.pem"
}

resource "aws_key_pair" "mykeypair" {
  key_name = local.ec2_key_name
  public_key = tls_private_key.generated.public_key_openssh
}

# resource "aws_s3_bucket" "michaelsbucket" {
#   bucket = "my-tf-test-bucket-elvis"

#   tags = {
#     Name        = "My bucket"
#     Environment = "Dev"
#   }
# }

# resource "aws_s3_bucket_policy" "bucket_policy" {
#   bucket = "${aws_s3_bucket.michaelsbucket.id}"

#   policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Principal": {
#         "AWS": "${var.user_arn}"
#       },
#       "Action": [ "s3:PutObject" ],
#       "Resource": [
#         "${aws_s3_bucket.michaelsbucket.arn}/*"        
#       ]
#     },
#     {
#       "Sid": "PublicRead",
#       "Effect": "Allow",
#       "Principal": "*",
#       "Action": [
#           "s3:GetObject",
#           "s3:GetObjectVersion"
#       ],
#       "Resource": [
#           "${aws_s3_bucket.michaelsbucket.arn}/*" 
#       ]
#     }
#   ]
# }
# EOF
# }


# output "petname" {
#   value = random_pet.this.id
# }

output "vpc_id" {
  value = module.our_class_vpc.vpc_id
}

output "animal" {
  value = var.alist[0]
}

output "new-key" {
  value = local.ec2_key_name
}


