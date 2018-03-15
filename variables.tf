/*
 * EBS variables
 */

variable "volumes_per_az" {
  description = "number of volumes per AZ"
  default = 1
}

variable "role" {
  type = "string"
  description = "server role"
}

variable "app_name" {
  type = "string"
  description = "application name"
}

variable "environment" {
  type = "string"
  description = "environment to configure"
}

variable "availability_zones" {
  type = "list"
  description = "list of AZs"
}

variable "type" {
  description = "EBS volume type (standard, gp2, st1)"
  default = "standard"
}

variable "size" {
  description = "volume size (GB)"
  default = 30
}

variable "iops" {
  description = "I/O operations per second (max is 50x volume size)"
  default = 0
}

variable "kms_key_arn" {
  default = ""
  type = "string"
}
