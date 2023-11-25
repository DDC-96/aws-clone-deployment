variable "aws_region" {
  default = "us-west-2"
  type    = string
}

variable "ami" {
  default = {
    us-west-2 = "ami-0efcece6bed30fd98"
  }
  type = map(any)
}

variable "username" {
  default = "dev-user"
  type    = string
}

variable "myIp" {
  default     = "76.94.42.142/32"
  type        = string
  description = "Ipaddr"
  sensitive   = true
}

variable "instance_count" {
  default = "1"
  type    = number
}

variable "instance_type" {
  default = "t2.medium"
  type    = string
}

variable "vpc_name" {
  default = "dev-vpc"
  type    = string
}

variable "Zone1" {
  default = "us-west-2a"
}

variable "Zone2" {
  default = "us-west-2b"
}

variable "vpc_cidr" {
  default = "172.31.0.0/16"
}

variable "pub_1cidr" {
  default = "172.31.1.0/24"
}

variable "pub_2cidr" {
  default = "172.31.2.0/24"
}

variable "priv_1cidr" {
  default = "172.31.3.0/24"
}

variable "priv_2cidr" {
  default = "172.31.4.0/24"
}

variable "pub_key" {
  default = "dev-key.pub"
}

variable "priv_key" {
  default = "dev-key"
}
