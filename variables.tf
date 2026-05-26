variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "project_id" {
  description = "the project identifier used for tagging"
  type        = string
}

variable "allowed_ip_range" {
  description = "A"
  type = list(string)
}

variable "vpc_name" {
  description = "b"
  type = string
}

variable "vpc_id" {
  description = "c"
  type = string
}

variable "vpc_cidr_block" {
  description = "c"
  type = string
}

variable "public_subnet_name" {
  description = "c"
  type = string
}

variable "public_subnet_id" {
  description = "c"
  type = string
}

variable "private_subnet_name" {
  description = "c"
  type = string
}

variable "private_subnet_id" {
  description = "c"
  type = string
}

variable "public_ec2_instance_name" {
  description = "c"
  type = string
}

variable "public_ec2_instance_id" {
  description = "c"
  type = string
}


variable "public_ec2_instance_port" {
  description = "c"
  type = string
}

variable "private_ec2_instance_name" {
  description = "c"
  type = string
}

variable "private_ec2_instance_id" {
  description = "c"
  type = string
}

variable "private_ec2_instance_port" {
  description = "c"
  type = string
}

