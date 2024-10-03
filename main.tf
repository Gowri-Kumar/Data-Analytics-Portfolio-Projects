# Configure terraform provider for Azure
terraform {
  required_version = ">= 1.9.5, < 2.0"
  required_providers {
    azurerm = {source = "hashicorp/azurerm"}
    databricks = {source = "databricks/databricks"}
  }
}

# Configure the Azure Provider
provider "azurerm"{
    features{}
    subscription_id = var.az_subscription_id
    tenant_id = var.az_tenant_id
    client_id = var.client_id
    client_secret = var.client_secret
}

# Retrive current azure tenant configs
data "azurerm_client_config" "current" {}

# create Azure Resource Group
resource "azurerm_resource_group" "this"{
    name = var.rg_name
    location = var.az_location
}

# module "lakehouse" {
#   source = "./modules/lakehouse"
#   resource_group_name = azurerm_resource_group.this.name
#   az_location = azurerm_resource_group.this.location
# }

module "databricks" {
  source = "./modules/databricks"
  resource_group_name = azurerm_resource_group.this.name
  az_location = azurerm_resource_group.this.location
}