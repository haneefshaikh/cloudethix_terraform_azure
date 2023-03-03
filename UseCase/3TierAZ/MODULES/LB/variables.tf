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

//LB
variable "public_ip" {
  type = string
}
