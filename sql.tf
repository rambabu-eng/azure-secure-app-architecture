resource "azurerm_mssql_server" "sql" {
  name                         = var.sql_server_name
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = var.sql_admin_login
  administrator_login_password = var.sql_admin_password

  public_network_access_enabled = false

  tags = {
    environment = "demo"
    project     = "secure-app"
  }
}

resource "azurerm_mssql_database" "db" {
  name      = var.sql_database_name
  server_id = azurerm_mssql_server.sql.id

  # Keep it cheap for dev
  sku_name = "Basic"
}