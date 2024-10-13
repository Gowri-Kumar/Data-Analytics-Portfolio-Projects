az_tenant_id                          = "81835726-6e9e-4770-8bb6-6c292f2fef3d" 
az_subscription_id                    = "f5db8d12-ebce-4e7d-b62c-6e149c62749b" 
account_id                            = "15365ebb-5d28-41bf-981f-d8ea3a86e8bd"
location                              = "australiasoutheast"

project_name                          = "data-analytics-portfolio-project"
metastore_name                        = "uc-metastore"
environment_name                      = "dev"
tags                                  = {"project name" = "data project"}

metastore_resource_group_name         = "adb-uc-metastore-rg"
access_connector_name                 = "uc-metastore-access-connector"
metastore_storage_name                = "ucmetastore0101010"

adb_lakehouse_resource_group_name     = "adb-lakehouse-rg"
databricks_workspace_name             = "databricks-ws"
key_vault_name                        = "data-project-kv"
data_factory_name                     = "data-project-adf-instance"
spoke_vnet_address_space              = "10.26.1.0/24"
public_subnet_address_prefixes        = ["10.26.1.0/25"]
private_subnet_address_prefixes       = ["10.26.1.128/25"]


