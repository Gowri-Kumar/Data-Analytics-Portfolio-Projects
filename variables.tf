  variable "az_tenant_id" { 
  type        = string
}

  variable "az_subscription_id" { 
  type        = string
}
  
  variable "account_id" {
  type        = string
  description = "(Required) Databricks account ID"
}

 variable "location" {
  type        = string
  description = "(Required) The location for the resources in this module"
}

variable "tags" {
  type        = map(string)
  description = "(Required) Map of tags to attach to resources"
  default     = {}
}

variable "metastore_resource_group_name" {
  type        = string
  description = "Name of the metastore resource group"
}

variable "metastore_name" {
  type        = string
  description = "the name of the metastore"
}

variable "metastore_storage_name" {
  type        = string
  description = "the account storage where we create the metastore"
}

variable "access_connector_name" {
  type        = string
  description = "the name of the access connector"
}

variable "adb_lakehouse_resource_group_name" {
  type        = string
  description = "(Required) The name of the Resource Group to create"
}

variable "managed_resource_group_name" {
  type        = string
  description = "(Optional) The name of the resource group where Azure should place the managed Databricks resources"
  default     = ""
}

variable "project_name" {
  type        = string
  description = "(Required) The name of the project associated with the infrastructure to be managed by Terraform"
}

variable "environment_name" {
  type        = string
  description = "(Required) The name of the project environment associated with the infrastructure to be managed by Terraform"
}

variable "spoke_vnet_address_space" {
  type        = string
  description = "(Required) The address space for the spoke Virtual Network"
}

variable "databricks_workspace_name" {
  type        = string
  description = "Name of Databricks workspace"
}

variable "data_factory_name" {
  type        = string
  description = "The name of the Azure Data Factory to deploy. Won't be created if not specified"
  default     = ""
}

variable "key_vault_name" {
  type        = string
  description = "The name of the Azure Key Vault to deploy. Won't be created if not specified"
  default     = ""
}

variable "private_subnet_address_prefixes" {
  type        = list(string)
  description = "Address space for private Databricks subnet"
}

variable "public_subnet_address_prefixes" {
  type        = list(string)
  description = "Address space for public Databricks subnet"
}

variable "storage_account_name" {
  type        = string
  description = "Names of additional storage accounts to create"
  default     = ""
}

variable "metastore_id" {
  type        = string
  description = "The ID of Unity Catalog metastore"
  default     = ""
}

variable "workspace_id" {
  type        = string
  description = "The ID of Databricks workspace"
  default     = ""
}

variable "lakehouse_external_location_name" {
  type        = string
  description = "the name of the landing external location"
  default = ""
}

variable "lakehouse_external_adls_path" {
  type        = string
  description = "The ADLS path of the landing zone"
  default = ""
}

variable "lakehouse_external_adls_rg" {
  type        = string
  description = "The resource group name of the landing zone"
  default = ""
}

variable "lakehouse_external_storage_credential_name" {
  type        = string
  description = "the name of the storage credential"
  default = ""
}

variable "access_connector_id" {
  type        = string
  description = "the id of the access connector"
  default = ""
}