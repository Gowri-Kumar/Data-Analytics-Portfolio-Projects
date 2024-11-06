# Reads configured adls extenal storage account
data "azurerm_storage_account" "ext_storage_acct" {
  name                = var.lakehouse_ext_storage_acct_location_name
  resource_group_name = var.lakehouse_ext_storage_acct_adls_rg
}

# Configures external credentials - links adls storage account to databricks workspace using access connector
resource "azurerm_role_assignment" "ext_storage_cred" {
  scope                = data.azurerm_storage_account.ext_storage_acct.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = var.access_connector_id
}

# Configures external location for landing zone az container
resource "databricks_external_location" "landing-zone" {
  depends_on = [ data.azurerm_storage_account.ext_storage_acct ]
  name            = "landing-zone"
  url             = var.lakehouse_external_adls_path_landing_zone
  credential_name = var.lakehouse_external_storage_credential_name
  comment         = "Landing Zone external storage az container"
}

# configures uc catalog and schema objects for landing zone az container
resource "databricks_catalog" "landing-catalog" {
  metastore_id  = var.metastore_id
  name          = "landing_catalog"
  comment       = "this catalog is for the landing zone"
  force_destroy = true
  storage_root = var.lakehouse_external_adls_path_landing_zone
  depends_on = [ databricks_external_location.landing-zone ]
}

resource "databricks_schema" "landing_schema" {
  depends_on    = [databricks_catalog.landing-catalog]
  catalog_name  = databricks_catalog.landing-catalog.name
  name          = "landing_schema"
  force_destroy = true
}

# Configures external location for bronze zone az container
resource "databricks_external_location" "bronze-zone" {
  depends_on = [ data.azurerm_storage_account.ext_storage_acct ]
  name            = "bronze-zone"
  url             = var.lakehouse_external_adls_path_bronze_zone
  credential_name = var.lakehouse_external_storage_credential_name
  comment         = "Bronze Zone external storage az container"
}

# configures uc catalog and schema objects for bronze zone az container
resource "databricks_catalog" "bronze-catalog" {
  metastore_id  = var.metastore_id
  name          = "bronze_catalog"
  comment       = "this catalog is for the bronze zone"
  force_destroy = true
  storage_root = var.lakehouse_external_adls_path_bronze_zone
  depends_on = [ databricks_external_location.bronze-zone ]
}

resource "databricks_schema" "bronze_schema" {
  depends_on    = [databricks_catalog.bronze-catalog]
  catalog_name  = databricks_catalog.bronze-catalog.name
  name          = "bronze_schema"
  force_destroy = true
}

# Configures external location for silver zone az container
resource "databricks_external_location" "silver-zone" {
  depends_on = [ data.azurerm_storage_account.ext_storage_acct ]
  name            = "silver-zone"
  url             = var.lakehouse_external_adls_path_silver_zone
  credential_name = var.lakehouse_external_storage_credential_name
  comment         = "silver Zone external storage az container"
}

# configures uc catalog and schema objects for silver zone az container
resource "databricks_catalog" "silver-catalog" {
  metastore_id  = var.metastore_id
  name          = "silver_catalog"
  comment       = "this catalog is for the silver zone"
  force_destroy = true
  storage_root = var.lakehouse_external_adls_path_silver_zone
  depends_on = [ databricks_external_location.silver-zone ]
}

resource "databricks_schema" "silver_schema" {
  depends_on    = [databricks_catalog.silver-catalog]
  catalog_name  = databricks_catalog.silver-catalog.name
  name          = "silver_schema"
  force_destroy = true
}

# Configures external location for gold zone az container
resource "databricks_external_location" "gold-zone" {
  depends_on = [ data.azurerm_storage_account.ext_storage_acct ]
  name            = "gold-zone"
  url             = var.lakehouse_external_adls_path_gold_zone
  credential_name = var.lakehouse_external_storage_credential_name
  comment         = "gold Zone external storage az container"
}

# configures uc catalog and schema objects for gold zone az container
resource "databricks_catalog" "gold-catalog" {
  metastore_id  = var.metastore_id
  name          = "gold_catalog"
  comment       = "this catalog is for the gold zone"
  force_destroy = true
  storage_root = var.lakehouse_external_adls_path_gold_zone
  depends_on = [ databricks_external_location.gold-zone ]
}

resource "databricks_schema" "gold_schema" {
  depends_on    = [databricks_catalog.gold-catalog]
  catalog_name  = databricks_catalog.gold-catalog.name
  name          = "gold_schema"
  force_destroy = true
}