variable "size" {
  type = map
  default = {
    size1 = "t2.micro"
	size2 = "t2.large"
	size3 = "t3.large"
  }
}

variable "listX" {
  type = list
  default = ["t2.micro","t3.micro"]
}