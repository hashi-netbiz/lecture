variable "user_arn" {
   type = string
   default = "arn:aws:iam::287074925751:user/jones"
}

variable "instanceTypes" {
  description = "my dog list"
  type = list
  default = ["bristol","london","sheffield"]
}

variable "etMap" {
  type = map
  default = {
    Name = "myvpc"   
    env = "test"
    manager ="jjkjjs"
  }
}

variable "cidrBlock" {
  description = "This is my dev cidr"
  default = "192.168.0.0/24"
}

variable "stgTaggs" {
  type = map
  default = {
    Name = "myvpc"   
    env = "staging"
    manager ="jjkjjs"
  }
}

variable "prodTags" {
  type = map
  default = {
    Name = "myvpc"   
    env = "prod"
    manager ="jjkjjs"
  }
}


