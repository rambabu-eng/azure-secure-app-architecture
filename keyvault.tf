data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  name                = var.key_vault_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"

  # Best-practice now: RBAC (not access policies)
  enable_rbac_authorization = true

  # Private-only (we will use Private Endpoint)
  public_network_access_enabled = false

  tags = {
    environment = "demo"
    project     = "secure-app"
  }
}