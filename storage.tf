resource "azurerm_resource_group" "remote-state" {
  name     = "remote-state-resources"
  location = "eastus"
}

resource "azurerm_storage_account" "remote-state" {
  name                     = "remotestatedemo"
  resource_group_name      = azurerm_resource_group.remote-state.name
  location                 = azurerm_resource_group.remote-state.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "remote-state" {
  name                  = "vhds"
  storage_account_name  = azurerm_storage_account.remote-state.name
  container_access_type = "private"
}
