output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}
output "public_ip" {
  value = azurerm_public_ip.public_ip.id
}
output "subnet_ids" {
  value = azurerm_subnet.subnet[*].id
}