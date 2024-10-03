# Define Azure Storage Account ADLS
resource "azurerm_storage_account" "lakehouse"{
  name = "lakehouse7storage77700"
  resource_group_name = var.resource_group_name
  location = var.az_location
  account_tier = "Standard"
  account_replication_type = "LRS"
  # Enabling Data Lake Gen2 capabilities
  is_hns_enabled = true
}

resource "azurerm_storage_container" "landing"{
  name = "landing"
  storage_account_name = azurerm_storage_account.lakehouse.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "bronze"{
  name = "bronze"
  storage_account_name = azurerm_storage_account.lakehouse.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "silver"{
  name = "silver"
  storage_account_name = azurerm_storage_account.lakehouse.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "gold"{
  name = "gold"
  storage_account_name = azurerm_storage_account.lakehouse.name
  container_access_type = "private"
}