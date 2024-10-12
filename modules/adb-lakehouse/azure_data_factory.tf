resource "azurerm_data_factory" "adf" {
  name                = var.data_factory_name
  location            = local.rg_location
  resource_group_name = local.rg_name
  tags                = var.tags
}