// TAG

variable "tag" {
  type = string
}
variable "tag_names" {
  type = map(any)
}

// VIRTUAL NET
variable "vnet_cidr" {
  type = list(any)
}

// SUBNET
variable "subnet_cidr" {
  type = list(any)
}

// RG
variable "rg_location" {
  type = string
}
variable "rg_name" {
  type = string
}

