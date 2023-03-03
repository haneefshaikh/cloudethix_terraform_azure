locals {
  vnet_name = format("%s-vnet", var.tag)
}
locals {
  subnet_name = format("%s-subnet", var.tag)
}
locals {
  public_ip_name = format("%s-public-ip", var.tag)
}
locals {
  nat_gateway_name = format("%s-nat-gateway", var.tag)
}