variable "metastore_id" {
  type        = string
  description = "The ID of Unity Catalog metastore"
}

variable "environment_name" {
  type        = string
  description = "(Required) The name of the project environment associated with the infrastructure to be managed by Terraform"
}

variable "lakehouse_external_location_name" {
  type        = string
  description = "the name of the landing external location"
}

variable "lakehouse_external_adls_path" {
  type        = string
  description = "The ADLS path of the landing zone"
}

variable "lakehouse_external_adls_rg" {
  type        = string
  description = "The resource group name of the landing zone"
}

variable "lakehouse_external_storage_credential_name" {
  type        = string
  description = "the name of the storage credential"
}

variable "access_connector_id" {
  type        = string
  description = "the id of the access connector"
}