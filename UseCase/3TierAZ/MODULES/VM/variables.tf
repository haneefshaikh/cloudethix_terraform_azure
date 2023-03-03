// RG
variable "rg_location" {
  type = string
}
variable "rg_name" {
  type = string
}

// TAG
variable "tag" {
  type = string
}
variable "tag_names" {
  type = map(any)
}

// NETWORK INTERFACE
variable "public_ip" {
  type = string
}
variable "subnet_id" {
  type = string
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


