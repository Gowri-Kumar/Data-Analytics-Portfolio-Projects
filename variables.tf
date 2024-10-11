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
