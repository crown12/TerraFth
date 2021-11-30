resource "azurerm_resource_group" "fthrg1" {
  name     = "fthrg1"
  location = "germanywestcentral"
}

resource "random_string" "myrandom" {
  length  = 15
  special = false
  upper   = false
}

resource "azurerm_storage_account" "mysa" {
  name                     = "mysa${random_string.myrandom.id}"
  resource_group_name      = azurerm_resource_group.fthrg1.name
  location                 = azurerm_resource_group.fthrg1.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    "environment" = "staging"
  }
}

resource "azurerm_storage_encryption_scope" "mysa" {
  name               = "microsoftmanaged"
  storage_account_id = azurerm_storage_account.mysa.id
  source             = "Microsoft.Storage"
}
