
# Create Random Pet Resource
resource "random_pet" "this" {
  length = 1
  prefix = "hashi"
}

# Configure the AWS Provider
provider "aws" {
  region  = "us-east-1"
}

# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "myvpc"
    team = "devops"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.example.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = random_pet.this.id
  }
}

resource "aws_instance" "web" {
    ami = "ami-09d3b3274b6c5d4aa"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.my_subnet.id

    tags = {
    Name = random_pet.this.id
  }
}

output "petname" {
  value = random_pet.this.id
}
