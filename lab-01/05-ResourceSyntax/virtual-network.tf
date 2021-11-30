resource "azurerm_network_ddos_protection_plan" "sddos" {
  name                = "ddospplan1"
  location            = azurerm_resource_group.myrg1.location
  resource_group_name = azurerm_resource_group.myrg1.name
}


resource "azurerm_virtual_network" "myvnet" {

  name                = "myvnet-1"
  location            = azurerm_resource_group.myrg1.location
  resource_group_name = azurerm_resource_group.myrg1.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  ddos_protection_plan {
    id     = azurerm_network_ddos_protection_plan.sddos.id
    enable = true
  }

  #   subnet {
  #     name           = "subnet1"
  #     address_prefix = "10.0.1.0/24"
  #   }

  #   subnet {
  #     name           = "subnet2"
  #     address_prefix = "10.0.2.0/24"
  #   }

  #   subnet {
  #     name           = "subnet3"
  #     address_prefix = "10.0.3.0/24"
  #     security_group = azurerm_network_security_group.example.id
  #   }

  tags = {
    "Environment" = "Dev"
  }
}

resource "azurerm_subnet" "mysubnet" {
  name                 = "subnet1"
  resource_group_name  = azurerm_resource_group.myrg1.name
  virtual_network_name = azurerm_virtual_network.myvnet.name

  address_prefixes = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "mypubip" {
  name                = "pubip"
  resource_group_name = azurerm_resource_group.myrg1.name
  location            = azurerm_resource_group.myrg1.location
  allocation_method   = "Static"

  tags = {
    "Environment" = "Dev"
  }
}


resource "azurerm_network_interface" "myvmnic" {
  name                = "myvmnic"
  location            = azurerm_resource_group.myrg1.location
  resource_group_name = azurerm_resource_group.myrg1.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.mysubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.mypubip.id

  }

}
