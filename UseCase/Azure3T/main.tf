terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.40.0"
    }
  }
}

provider "azurerm" {
  features {}
}

// RESOURCE GROUP
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.rg_location
}
