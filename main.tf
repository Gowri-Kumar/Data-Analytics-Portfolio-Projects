module "adb-lakehouse-uc-metastore" {
  source                     = "./modules/adb-uc-metastore"
  metastore_storage_name     = var.metastore_storage_name
  metastore_name             = var.metastore_name
  access_connector_name      = var.access_connector_name
  metastore_resource_group_name = var.metastore_resource_group_name
  location                   = var.location
  tags                       = var.tags
  providers = {
    databricks = databricks.account
  }
}

