resource "azurerm_service_plan" "asp" {
  name                = "asp-secure-demo"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  os_type  = "Linux"
  sku_name = "B1" # small/cheap for dev

  tags = {
    environment = "demo"
    project     = "secure-app"
  }
}
resource "azurerm_linux_web_app" "app" {
  name                = var.web_app_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  service_plan_id     = azurerm_service_plan.asp.id

  https_only = true

  identity {
    type = "SystemAssigned"
  }
  virtual_network_subnet_id = azurerm_subnet.app_subnet.id

  # ✅ TOP-LEVEL app settings
  app_settings = {
    "DEMO_SECRET" = "@Microsoft.KeyVault(SecretUri=https://${azurerm_key_vault.kv.name}.vault.azure.net/secrets/DemoSecret/)"
  }

  site_config {
    always_on = false
  }

  tags = {
    environment = "demo"
    project     = "secure-app"
  }
}
