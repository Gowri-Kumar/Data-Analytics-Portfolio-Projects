module "adb-uc-metastore" {
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

#this will create lakehouse platform elements - databricks ws within vnet, azure storage objects, data factory instance and key vault
module "adb-lakehouse" {
  depends_on                          = [module.adb-uc-metastore]
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
  storage_account_name               = var.storage_account_name
  tags                                = var.tags
}


# Configure Databricks CLI - Databricks configure --token  --> This manual step requries databricks workspace URL and user token generated to access databricks API via CLI



#this will assign uc to a specific workspace
module "adb-ws-uc-assignment" {
  depends_on          = [ module.adb-lakehouse ]
  source              = "./modules/adb-ws-uc-assignment"
  workspace_id        = module.adb-lakehouse.workspace_id
  metastore_id        = module.adb-uc-metastore.metastore_id
   providers = {
    databricks = databricks.account
  }
}

#this module will configure uc data objects including external storage locations, catalogs, schemas
module "adb-uc-data-objects" {
  depends_on                     = [module.adb-uc-metastore]
  source                         = "./modules/adb-uc-data-objects"
  environment_name               = var.environment_name
  metastore_id                   = module.adb-uc-metastore.metastore_id
  lakehouse_external_storage_credential_name        = var.access_connector_name
  access_connector_id            = module.adb-uc-metastore.access_connector_principal_id
  lakehouse_ext_storage_acct_location_name = var.storage_account_name
  lakehouse_ext_storage_acct_adls_rg                = var.adb_lakehouse_resource_group_name  
  lakehouse_external_adls_path_landing_zone              = format("abfss://%s@%s.dfs.core.windows.net/",
                                                          "landing",
                                                        var.storage_account_name)
  lakehouse_external_adls_path_bronze_zone              = format("abfss://%s@%s.dfs.core.windows.net/",
                                                          "bronze",
                                                        var.storage_account_name)
  lakehouse_external_adls_path_silver_zone              = format("abfss://%s@%s.dfs.core.windows.net/",
                                                        "silver",
                                                      var.storage_account_name)
  lakehouse_external_adls_path_gold_zone              = format("abfss://%s@%s.dfs.core.windows.net/",
                                                        "gold",
                                                      var.storage_account_name)                                                      
  providers = {
    databricks = databricks.workspace
  }
}

# configuring GIT creds and repo
module "adb-git" {
  depends_on = [ module.adb-lakehouse ]
  source              = "./modules/adb-git"
  MyGitPAT = var.MyGitPAT
  MyGitRepoURL = var.MyGitRepoURL
}