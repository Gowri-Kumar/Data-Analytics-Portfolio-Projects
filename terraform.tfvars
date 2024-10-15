az_tenant_id                          = "81835726-6e9e-4770-8bb6-6c292f2fef3d" 
az_subscription_id                    = "f5db8d12-ebce-4e7d-b62c-6e149c62749b" 
account_id                            = "15365ebb-5d28-41bf-981f-d8ea3a86e8bd"
location                              = "australiasoutheast"

project_name                          = "data-analytics-portfolio-project"
metastore_name                        = "uc-metastore"
environment_name                      = "dev"
tags                                  = {"project name" = "data project"}

#uc metastore
metastore_resource_group_name         = "adb-uc-metastore-rg"
access_connector_name                 = "uc-metastore-access-connector"
metastore_storage_name                = "ucmetastore0101010"

#lakehouse platform - adb ws, network, storage , kv , adf
adb_lakehouse_resource_group_name     = "adb-lakehouse-rg"
databricks_workspace_name             = "databricks-ws"
storage_account_name                  = "dlslakehouse0101010"
key_vault_name                        = "data-project-kv"
data_factory_name                     = "data-project-adf-instance"
spoke_vnet_address_space              = "10.26.1.0/24"
public_subnet_address_prefixes        = ["10.26.1.0/25"]
private_subnet_address_prefixes       = ["10.26.1.128/25"]

#git
MyGitPAT = "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"
MyGitRepoURL = "https://github.com/Gowri-Kumar/Data-Analytics-Portfolio-Projects.git"

