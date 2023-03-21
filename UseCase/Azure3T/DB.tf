
resource "azurerm_private_dns_zone" "this_private_dbs_zone" {
  name                = "softdrone.mysql.database.azure.com"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "this_dns_zone_vlink" {
  name                  = "exampleVnetZone.com"
  private_dns_zone_name = azurerm_private_dns_zone.this_private_dbs_zone.name
  virtual_network_id    = azurerm_virtual_network.vnet.id
  resource_group_name   = azurerm_resource_group.rg.name
}

resource "azurerm_mysql_flexible_server" "this_mysql_server" {
  name                   = var.server_name
  resource_group_name    = azurerm_resource_group.rg.name
  location               = azurerm_resource_group.rg.location
  administrator_login    = "psqladmin"
  administrator_password = "H@Sh1CoR3!"
  backup_retention_days  = 7
  delegated_subnet_id    = azurerm_subnet.db_subnet.id
  private_dns_zone_id    = azurerm_private_dns_zone.this_private_dbs_zone.id
  sku_name               = "GP_Standard_D2ds_v4"
  depends_on             = [azurerm_private_dns_zone_virtual_network_link.this_dns_zone_vlink]
  tags                   = local.tag_names
}


resource "azurerm_mysql_flexible_database" "example" {
  name                = var.db_name
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_mysql_flexible_server.this_mysql_server.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}
