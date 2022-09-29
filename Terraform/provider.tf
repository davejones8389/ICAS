terraform {
  backend "local" {
    #resource_group_name  = "terraform"
    #container_name       = "tfstate"
    #storage_account_name = "icastfstate"
    #key                  = "icaswf"
  }

  #required_version = "1.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.67.0"
    }
  }
}

provider "azurerm" {
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id

  features {}
}

data "azurerm_client_config" "current" {
}