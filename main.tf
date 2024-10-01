# Configure the Azure Provider
provider "azurerm"{
    features{}
    subscription_id = var.az_subscription_id
    tenant_id = var.az_tenant_id
}

# Retrive current azure tenant configs
data "azurerm_client_config" "current" {}

# create Azure Resource Group
resource "azurerm_resource_group" "this"{
    name = var.rg_name
    location = var.az_location
}
