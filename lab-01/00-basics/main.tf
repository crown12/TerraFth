terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }

  required_version = ">= 0.14.9"
}
provider "azurerm" {
  features {

  }
}
#terraform import azurerm_resource_group.rg /subscriptions/6c7709b7-0ee8-4ea7-91c5-c4efd690c346/resourceGroups/chbn-fathi-rcs
resource "azurerm_resource_group" "rg" {
  name     = "kubernetesMasterClass"
  location = "germanywestcentral"
  tags = {
    environment = "dev-fth"
    source      = "Terraform"
    owner       = "fth"
  }
}

resource "azurerm_container_group" "cg" {
  name                = "weatherapi"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_address_type = "public"
  dns_name_label  = "fthtf"
  os_type         = "Linux"

  container {
    name   = "weatherapi"
    image  = "cfathi/weatherapi:v1"
    cpu    = "1"
    memory = "1"

    ports {
      port     = 80
      protocol = "TCP"
    }
  }

}
