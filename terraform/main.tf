terraform {
  backend "azurerm" {
    resource_group_name  = "TerraformHW3"
    storage_account_name = "terraformhw3storage"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "arg" {
  name     = "TerraformHW3"
  location = "West Europe"
}

resource "azurerm_storage_account" "asa" {
  name                     = "terraformhw3storage"
  resource_group_name      = "TerraformHW3"
  account_tier             = "Standard"
  location                 = "West Europe"
  account_replication_type = "LRS"

  tags = {
    environment = "production"
  }
}
