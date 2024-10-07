# Configure terraform provider for Azure
terraform {
  required_version = ">= 1.9.5, < 2.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
    databricks = {
      source = "databricks/databricks"
    }
  }
}

# Define a Databricks Workspace
resource "azurerm_databricks_workspace" "databricks_ws" {
  name = "databricks_ws"
  resource_group_name = var.resource_group_name
  location = var.az_location
  sku = "premium"

  # specifying rg for datarbricks managed resources (ex:network, compute etc)
  managed_resource_group_name = "${var.resource_group_name}-databricks-managed-rg"
}

# configuring databricks workspace provider
provider "databricks"{
  alias = "workspace"
  host = azurerm_databricks_workspace.databricks_ws.workspace_url
  token = var.db_ws_sp_token
}

# configuring databricks account provider
provider "databricks" {
  alias = "account"
  host = "https://accounts.azuredatabricks.net"
  account_id = var.account_id
}

data "databricks_metastores" "this" {
    provider      = databricks.account
}