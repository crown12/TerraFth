resource "azurerm_resource_group" "fth_p1" {
  name     = "fth-p1"
  location = "East US"
}

resource "azurerm_resource_group" "fth_p2" {
  name     = "fht-p2"
  location = "West US"
  provider = azurerm.provider2-westus

}
