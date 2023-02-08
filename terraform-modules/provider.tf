terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.28.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "andreea-rg"
    storage_account_name = "storageandreea18"
    container_name       = "tfstate"
    key                  = "tfstate"
    access_key           = "vEj+VGztnbgwyCMsrcuJV9xKuBxwqPtwKdB6dUTBgGzsbwovPX4dOPtWBIeweMRkkyd7khEQz4j7+AStcG/JZg=="
  }
}

provider "azurerm" {
  features {}
}
