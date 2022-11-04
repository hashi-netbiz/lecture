
# Create Random Pet Resource
resource "random_pet" "this" {
  length = 2
  prefix = "hashi" 
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# //Create a VPC
# resource "aws_vpc" "example" {
#   cidr_block = "10.0.0.0/16"

#   #vpc_id = "vpc-0fc86217f0b332668"

#   tags = {
#     Name = "myvpc"
#     team = "devops"
#   }
# }

# resource "aws_subnet" "my_subnet" {
#   vpc_id            = aws_vpc.example.id
#   cidr_block        = "10.0.1.0/24"
#   availability_zone = "us-east-1a"
#   #availability_zone = data.aws_availability_zones.available.names[0]

#   tags = {
#     Name = random_pet.this.id
#   }
# }

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

# resource "aws_instance" "web" {
#   ami           = "ami-09d3b3274b6c5d4aa"
#   instance_type = "t2.micro"
#   subnet_id     = aws_subnet.my_subnet.id
 
#   tags = {
#     Name = random_pet.this.id
#   }
# }

resource "aws_s3_bucket" "michaelsbucket" {
  bucket = "my-tf-test-bucket-elvis"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}


resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = "${aws_s3_bucket.michaelsbucket.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "${var.user_arn}"
      },
      "Action": [ "s3:PutObject" ],
      "Resource": [
        "${aws_s3_bucket.michaelsbucket.arn}/*"        
      ]
    },
    {
      "Sid": "PublicRead",
      "Effect": "Allow",
      "Principal": "*",
      "Action": [
          "s3:GetObject",
          "s3:GetObjectVersion"
      ],
      "Resource": [
          "${aws_s3_bucket.michaelsbucket.arn}/*" 
      ]
    }
  ]
}
EOF
}


output "petname" {
  value = random_pet.this.id
}





