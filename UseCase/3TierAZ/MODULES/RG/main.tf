
// RESOURCE GROUP
resource "azurerm_resource_group" "resource_group" {
  name     = local.rg_name
  location = var.rg_location
  tags     = var.tag_names
}
