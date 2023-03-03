locals {
  lb_name = format("%s-lb", var.tag)
}
locals {
  front_ip_name = format("%s-forntend-ip", var.tag)
}
locals {
  public_ip_name = format("%s-lb-public-ip", var.tag)
}
locals {
  backend_address_name = format("%s-backend-pool", var.tag)
}



