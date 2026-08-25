terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=5.0.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "dev-iam-rg"
    storage_account_name = "deviamstorageacctv1"
    container_name       = "dev-iam-tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}
