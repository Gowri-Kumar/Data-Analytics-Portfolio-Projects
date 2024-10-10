provider "azurerm" {
  features {}
  subscription_id = var.az_subscription_id
  tenant_id = var.az_tenant_id
}

provider "databricks" {
  alias      = "account"
  host       = "https://accounts.azuredatabricks.net"
  account_id = var.account_id
}

provider "databricks" {
  alias = "workspace"
  host  = module.adb-lakehouse.workspace_url
}