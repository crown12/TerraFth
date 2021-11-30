terraform {
  required_version = ">= 0.14.9"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.65"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0"
    }
  }

}

provider "azurerm" {
  features {
  }
}
