variable "subnet_cidr" {
   type = string
   default = "10.0.1.0/24"
}

variable "instanceTypes" {
  description = "instance type"
  type = string
  default = "t2.micro"
}

variable "local-ami" {
  type = string
  default = "ami-09d3b3274b6c5d4aa"
}

variable "cidrBlock" {
  description = "This is my dev cidr"
  default = "10.0.0.0/16"
}

variable "alist" {
  type = list
  default = ["elephant","tiger","pig"]
}



