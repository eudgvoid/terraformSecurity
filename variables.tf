variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "project_id" {
  description = "the project identifier used for tagging"
  type        = string
}

variable "allowed_ip_range" {
  type = list(string)
}

variable "vpc_name" {
  type        = string
}

variable "vpc_id" {
  type = string
}

variable "vpc_cidr_block" {
  type = string
}

variable "public_subnet_name" {
  type        = string
}

variable "public_subnet_id" {
  type = string
}

variable "private_subnet_name" {
  type        = string
}

variable "private_subnet_id" {
  type = string
}

variable "public_ec2_instance_name" {
  type = string
}

variable "public_ec2_instance_id" {
  type = string
}


variable "public_ec2_instance_port" {
  type = string
}

variable "private_ec2_instance_name" {
  type = string
}

variable "private_ec2_instance_id" {
  type = string
}

variable "private_ec2_instance_port" {
  type = string
}

