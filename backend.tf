terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate-aks-t3"
    storage_account_name = "sttfstate261551780"
    container_name       = "tfstate"
    key                  = "azure-secure-app-architecture-dev.tfstate"
  }
}