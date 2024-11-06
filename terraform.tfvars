az_tenant_id                          = "a4fe8d9b-ba0b-4008-9b0c-f0ddd64d9b8d" 
az_subscription_id                    = "1f8958c3-9b0e-49d2-8790-c0292be38da3" 
account_id                            = "c620512f-d047-4053-bc4a-46f77074162f" #adb account id
location                              = "australiasoutheast"

project_name                          = "data-analytics-portfolio-project"
metastore_name                        = "uc-metastore"
environment_name                      = "dev"
tags                                  = {"project name" = "data project"}

#uc metastore
metastore_resource_group_name         = "adb-uc-metastore-rg"
access_connector_name                 = "uc-metastore-access-connector"
metastore_storage_name                = "ucmetastoreap1234rd"

#lakehouse platform - adb ws, network, storage , kv , adf
adb_lakehouse_resource_group_name     = "adb-lakehouse-rg"
databricks_workspace_name             = "databricks-ws"
storage_account_name                  = "dlslakehouseap1234rd"
key_vault_name                        = "data-project-kv-1234rd"
data_factory_name                     = "data-project-adf-instance-1234rd"
spoke_vnet_address_space              = "10.26.1.0/24"
public_subnet_address_prefixes        = ["10.26.1.0/25"]
private_subnet_address_prefixes       = ["10.26.1.128/25"]

#git
MyGitPAT = "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"
MyGitRepoURL = "https://github.com/Gowri-Kumar/Data-Analytics-Portfolio-Projects.git"

