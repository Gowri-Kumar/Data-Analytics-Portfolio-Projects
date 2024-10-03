# Define a Databricks Workspace
resource "azurerm_databricks_workspace" "databricks_ws" {
  name = "databricks_ws"
  resource_group_name = var.resource_group_name
  location = var.az_location
  sku = "premium"

  # specifying rg for datarbricks managed resources (ex:network, compute etc)
  managed_resource_group_name = "${var.resource_group_name}-databricks-managed-rg"
}