
// NETWORK INTERFACE
resource "azurerm_network_interface" "network_interface" {
  name                = local.interface_name
  location            = var.rg_location
  resource_group_name = var.rg_name
  tags                = var.tag_names

  ip_configuration {
    name                          = "cloud-config-01"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.public_ip
  }
}

// VIRTUAL MACHINE
resource "azurerm_virtual_machine" "vm" {
  name                             = format("%s-%s", local.vm_names, var.vm_name)
  location                         = var.rg_location
  resource_group_name              = var.rg_name
  network_interface_ids            = [azurerm_network_interface.network_interface.id]
  vm_size                          = var.vm_type
  tags                             = var.tag_names
  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = format("%s-%s", local.os_disk, var.vm_name)
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = var.vm_hostname
    admin_username = var.vm_username
    admin_password = var.vm_password
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}