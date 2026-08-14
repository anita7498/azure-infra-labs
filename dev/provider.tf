terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=5.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = "dev-iam-rg"
    storage_account_name = "deviamstorageacct"
    container_name       = "iam-tfstate"
    key                  = "terraform.tfstate"
  }
}
