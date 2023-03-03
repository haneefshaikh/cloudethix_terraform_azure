// VIRTUAL NETWORK
resource "azurerm_virtual_network" "vnet" {
  name                = local.vnet_name
  location            = var.rg_location
  resource_group_name = var.rg_name
  address_space       = var.vnet_cidr
  tags                = var.tag_names
}


// SUBNET
resource "azurerm_subnet" "subnet" {
  name                 = format("%s-%s", local.subnet_name, "${count.index}")
  resource_group_name  = var.rg_name
  virtual_network_name = local.vnet_name
  address_prefixes     = [element(var.subnet_cidr, count.index)]
  count                = length(var.subnet_cidr)
  depends_on = [
    azurerm_virtual_network.vnet
  ]
}


//PUBLIC IP
resource "azurerm_public_ip" "public_ip" {
  name                = local.public_ip_name
  resource_group_name = var.rg_name
  location            = var.rg_location
  allocation_method   = "Static"
  sku                 = "Standard"
}

//NAT GATEWAY
resource "azurerm_nat_gateway" "nat_gateway" {
  name                = local.nat_gateway_name
  resource_group_name = var.rg_name
  location            = var.rg_location
}

/*/NAT GATEWAY ASSOCIATION TO PUBLIC IP
resource "azurerm_nat_gateway_public_ip_association" "nat_publi_association" {
  nat_gateway_id       = azurerm_nat_gateway.nat_gateway.id
  public_ip_address_id = azurerm_public_ip.public_ip.id
}*/

//SUBNET ASSOCIATION TO NAT GATEWAY 
resource "azurerm_subnet_nat_gateway_association" "nat_gateway_subnet_association" {
  subnet_id      = azurerm_subnet.subnet[count.index].id
  nat_gateway_id = azurerm_nat_gateway.nat_gateway.id
  count          = length(var.subnet_cidr)
}