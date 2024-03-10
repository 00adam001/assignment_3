terraform {
  backend "azurerm" {
    resource_group_name  = "TerraformHW3"
    storage_account_name = "terraformhw3storage"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}

resource "azurerm_resource_group" "arg" {
  name     = "TformHW3"
  location = "West Europe"
}

resource "azurerm_storage_account" "asa" {
  name                     = "tformhw3storage"
  resource_group_name      = "TerraformHW3"
  account_tier             = "Standard"
  location                 = "West Europe"
  account_replication_type = "LRS"

  tags = {
    environment = "production"
  }
}

resource "azurerm_app_service" "AZAPP" {
  name                = "Azure-app-service"
  location            = "West Europe"
  resource_group_name = "TerrafoormHW3"
  app_service_plan_id = azurerm_app_service_plan.AZAPP.id

  site_config {
    python_version = "3.8"
  }

  app_settings = {
    "FLASK_APP" = "HW3my-app.py"
    "WEBSITE_RUN_FROM_PACKAGE" = "https://github.com/00adam001/assignment_3/archive/refs/heads/main.zip"
  }
}
