resource "azurerm_resource_group" "dev-rg" {
  name     = "dev-iam-rg"
  location = "Central India"
}

resource "azurerm_storage_account" "dev-storage" {
  name                     = "deviamstorageacctv1"
  resource_group_name      = azurerm_resource_group.dev-rg.name
  location                 = azurerm_resource_group.dev-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "dev-container" {
  name                  = "dev-iam-tfstate"
  storage_account_id    = azurerm_storage_account.dev-storage.id
  container_access_type = "private"
}