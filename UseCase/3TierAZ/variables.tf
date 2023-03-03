//TAG
variable "application" {
  type = string
}
variable "product" {
  type = string
}
variable "environment" {
  type = string
}

//RG
variable "rg_location" {
  type = string
}

// VIRTUAL NET
variable "vnet_cidr" {
  type = list(any)
}

// SUBNET
variable "subnet_cidr" {
  type = list(any)
}

// VM
variable "vm_name" {
  type = string
}
variable "vm_type" {
  type = string
}
variable "vm_hostname" {
  type = string
}
variable "vm_username" {
  type = string
}
variable "vm_password" {
  type = string
}