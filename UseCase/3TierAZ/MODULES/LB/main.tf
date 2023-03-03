
resource "azurerm_public_ip" "public_ip" {
  name                = local.public_ip_name
  location            = var.rg_location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
}

resource "azurerm_lb" "lb" {
  name                = local.lb_name
  location            = var.rg_location
  resource_group_name = var.rg_name
  tags                = var.tag_names

  frontend_ip_configuration {
    name                 = local.front_ip_name
    public_ip_address_id = azurerm_public_ip.public_ip.id
  }
}

resource "azurerm_lb_backend_address_pool" "backend_address_pool" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = local.backend_address_name
}