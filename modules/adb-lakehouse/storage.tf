resource "azurerm_storage_account" "dls" {
  name                     = var.storage_account_name
  location                 = local.rg_location
  resource_group_name      = local.rg_name
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags                     = var.tags
  is_hns_enabled           = true
}

resource "azurerm_storage_container" "landing" {
  name                  = "landing"
  storage_account_name  = azurerm_storage_account.dls.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "bronze" {
  name                  = "bronze"
  storage_account_name  = azurerm_storage_account.dls.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "silver" {
  name                  = "silver"
  storage_account_name  = azurerm_storage_account.dls.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "gold" {
  name                  = "gold"
  storage_account_name  = azurerm_storage_account.dls.name
  container_access_type = "private"
}