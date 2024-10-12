resource "azurerm_resource_group" "this" {
  name     = var.adb_lakehouse_resource_group_name
  location = var.location
  tags     = var.tags
}

data "azurerm_resource_group" "this" {
  name  = var.adb_lakehouse_resource_group_name

}

locals {
  rg_name     = data.azurerm_resource_group.this.name
  rg_id       = data.azurerm_resource_group.this.id
  rg_location = data.azurerm_resource_group.this.location
}

data "azurerm_client_config" "current" {
}