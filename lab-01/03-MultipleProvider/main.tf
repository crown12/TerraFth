terraform {
  required_version = ">=0.14.9"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.65"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azurerm" {
  features {
    virtual_machine {
      delete_os_disk_on_deletion = false
    }
  }
  alias = "provider2-westus"
}
