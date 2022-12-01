resource "aws_vpc" "hashi_vpc" {
  cidr_block = var.cidr_block_hashi

  tags = {
    "Name" = "New-VPC"
  }
}

output "vpc_id" {
  value =  aws_vpc.hashi_vpc.id
}


