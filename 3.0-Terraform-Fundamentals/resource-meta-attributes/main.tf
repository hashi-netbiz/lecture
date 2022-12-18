terraform {
	required_providers {
		aws = {
			source  = "hashicorp/aws"
			version = "~> 3.74"
		}
	}
}

provider "aws" {
	region = "us-east-1"
}

provider "aws" {
	alias  = "west"
	region = "us-west-1"
}

provider "aws" {
	alias  = "mumbai"
	region = "ap-south-1"
}

# resource "aws_instance" "web" {
# 	count         = 2
# 	ami           = "ami-003634241a8fcdec0"
# 	instance_type = "t2.micro"

# 	tags = {
# 		Name = "Tuts Test ${count.index}"
# 	}
# }
# output "foo" {
# 	# lists out an list/array of instance ids
# 	#value = aws_instance.web[*].id
# 	value = [for instance in aws_instance.web : instance.public_ip]
# }
#aws_instance.web[0].id
#aws_instance.web.*.id

# resource "aws_instance" "web" {
# 	for_each = var.size
# 	ami           = "ami-003634241a8fcdec0"
# 	instance_type = each.value

# 	tags = {
# 		Name = "${each.key}"
# 	}
# }
#aws_instance.web["foo"].id


# resource "aws_instance" "web" {
# 	provider      = aws.mumbai
# 	ami           = "ami-0f5e8a042c8bfcd5e"
# 	instance_type = "t2.micro"

# 	tags = {
# 		Name = "Tuts in the west"
# 	}
# }



# resource "aws_instance" "web" {
# 	count = 2
# 	provider      = aws.west
# 	ami           = "ami-0f5e8a042c8bfcd5e"
# 	instance_type = "t2.micro"

# 	tags = {
# 		Name = "instance ${count.index}"
# 	}

# 	# lifecycle {
# 	# 	#create_before_destroy = true
# 	# 	#prevent_destroy       = true
# 	# 	#ignore_changes        = [tags]
# 	# }
# }

