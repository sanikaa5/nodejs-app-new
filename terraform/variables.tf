variable "aws_region" {
  default = "us-east-1"
}

variable "ami_id" {
  default = "ami-0c02fb55956c7d316" # Ubuntu 22.04
}

variable "instance_type" {
  default = "t2.medium"
}

variable "key_name" {
  default = "nodekey"
}
