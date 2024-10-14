resource "azurerm_storage_account" "dls" {
  count                    = length(var.storage_account_names)
  name                     = "dls${var.storage_account_names[count.index]}${var.environment_name}"
  location                 = var.location
  resource_group_name      = var.adb_lakehouse_resource_group_name
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags                     = var.tags
  is_hns_enabled           = true
}

resource "azurerm_storage_container" "landing" {
  name                  = "landing"
  storage_account_name  = azurerm_storage_account.dls[0].name
  container_access_type = "private"
}

resource "azurerm_storage_container" "bronze" {
  name                  = "bronze"
  storage_account_name  = azurerm_storage_account.dls[0].name
  container_access_type = "private"
}

resource "azurerm_storage_container" "silver" {
  name                  = "silver"
  storage_account_name  = azurerm_storage_account.dls[0].name
  container_access_type = "private"
}

resource "azurerm_storage_container" "gold" {
  name                  = "gold"
  storage_account_name  = azurerm_storage_account.dls[0].name
  container_access_type = "private"
}