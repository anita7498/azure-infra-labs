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
resource "azurerm_virtual_network" "dev-vnet" {
  name                = "dev-iam-vnet"
  location            = azurerm_resource_group.dev-rg.location
  resource_group_name = azurerm_resource_group.dev-rg.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "dev-subnet" {
  name                 = "dev-iam-subnet"
  resource_group_name  = azurerm_resource_group.dev-rg.name
  virtual_network_name = azurerm_virtual_network.dev-vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "dev-subnet1" {
  name                 = "dev-iam-subnet1"
  resource_group_name  = azurerm_resource_group.dev-rg.name
  virtual_network_name = azurerm_virtual_network.dev-vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}