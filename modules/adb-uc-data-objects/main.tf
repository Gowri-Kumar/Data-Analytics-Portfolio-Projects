# Reads configured adls extenal storage account
data "azurerm_storage_account" "ext_storage" {
  name                = var.lakehouse_external_location_name
  resource_group_name = var.lakehouse_external_adls_rg
}

# Configures external credentials - links adls storage account to databricks workspace using access connector
resource "azurerm_role_assignment" "ext_storage" {
  scope                = data.azurerm_storage_account.ext_storage.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = var.access_connector_id
}


# Configures laekhouse external adls container to databricks
resource "databricks_external_location" "landing-external-location" {
  name            = var.lakehouse_external_location_name
  url             = var.lakehouse_external_adls_path
  credential_name = var.lakehouse_external_storage_credential_name
  comment         = "Created by TF"
}