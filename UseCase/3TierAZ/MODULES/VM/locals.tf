locals {
  vm_names = format("%s-vm", var.tag)
}
locals {
  interface_name = format("%s-interface", var.tag)
}
locals {
  os_disk = format("%s-os-disk-",var.tag)
}
