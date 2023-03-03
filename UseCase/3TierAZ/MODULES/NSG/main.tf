

// SECURITY GROUP 
resource "azurerm_network_security_group" "security_group" {
  name                = var.sg_name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name

  security_rule {
    name                       = "AllowWebTraffic"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "sg_association" {
  subnet_id                 = azurerm_subnet.security_group.id
  network_security_group_id = azurerm_network_security_group.security_group.id
}