resource "azurerm_resource_group" "rg" {
  #name = "${local.resouce_name_prefix}-${var.resouce_group_name}"
  name     = "${local.resouce_name_prefix}-${var.resource_group_name}-${random_string.myrandom.id}"
  location = var.resource_group_location
  tags     = local.common_tags
}
