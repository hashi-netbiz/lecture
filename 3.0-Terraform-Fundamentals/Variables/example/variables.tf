variable "ami" {
	type        = string
	description = "AMI for ec2"
	default = "9832965329865923"
}

variable "ec2_name" {
	type = string
	default = "hashi1"
}

variable "v2_map" {
	type = map
	description = "this would be used as tags to my ec2 instances"
	default = {
		"name" = "tango"
		"fruit" = "peasr"
	}
}

variable "vpc_tags" {
	type = object({
		Name = string
		foo  = string
		baz  = number
	})
}

# variable "vpc_tags" {
# 	type = map
# }

variable "foo" {
	type = list(number)
	default = [1, 5, 9]
}