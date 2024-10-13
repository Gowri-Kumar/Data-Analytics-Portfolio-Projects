Refer - https://github.com/databricks/terraform-databricks-examples/blob/main/modules/adb-lakehouse/README.md

This module will create
- A new resource group
- Networking resources including:
    - Azure vnet
    - The required subnets for the Azure Databricks workspace.
    - Azure route table (if needed)
    - Network Security Group (NSG)
- The Lakehouse platform resources, including:
    - Azure Databricks workspace
    - Azure Data Factory
    - Azure Key Vault
    - Azure Storage account