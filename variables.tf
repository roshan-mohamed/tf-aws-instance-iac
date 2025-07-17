variable "key_name" {
  description = "Existing Key Pair Name"
  type        = string
  default     = "key-name"
}

variable "subnet_id" {
  description = "Existing Subnet ID"
  type        = string
  default     = "subnet-xxx"
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
  default     = "ami-xxx"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "tags" {
  type = map(string)
  default = {
    appname    = "myapp"
    costcenter = "cc123"
    appid      = "app456"
  }
}
