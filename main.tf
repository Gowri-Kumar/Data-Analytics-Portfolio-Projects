module "adb-lakehouse-uc-metastore" {
  # With UC by default we need to explicitly create a UC metastore, otherwise it will be created automatically
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

module "adb-lakehouse" {
  depends_on                          = [module.adb-lakehouse-uc-metastore]
  source                              = "./modules/adb-lakehouse"
  project_name                        = var.project_name
  environment_name                    = var.environment_name
  location                            = var.location
  spoke_vnet_address_space            = var.spoke_vnet_address_space
  adb_lakehouse_resource_group_name   = var.adb_lakehouse_resource_group_name
  managed_resource_group_name         = var.managed_resource_group_name
  databricks_workspace_name           = var.databricks_workspace_name
  data_factory_name                   = var.data_factory_name
  key_vault_name                      = var.key_vault_name
  private_subnet_address_prefixes     = var.private_subnet_address_prefixes
  public_subnet_address_prefixes      = var.public_subnet_address_prefixes
  storage_account_names               = var.storage_account_names
  tags                                = var.tags
}
