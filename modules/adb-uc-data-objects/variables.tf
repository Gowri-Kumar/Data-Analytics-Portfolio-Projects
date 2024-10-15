variable "metastore_id" {
  type        = string
  description = "The ID of Unity Catalog metastore"
}

variable "environment_name" {
  type        = string
  description = "(Required) The name of the project environment associated with the infrastructure to be managed by Terraform"
}

variable "lakehouse_ext_storage_acct_location_name" {
  type        = string
  description = "the name of the external location"
}

variable "lakehouse_ext_storage_acct_adls_rg" {
  type        = string
  description = "The resource group name of the adls"
}

variable "lakehouse_external_storage_credential_name" {
  type        = string
  description = "the name of the storage credential"
}

variable "access_connector_id" {
  type        = string
  description = "the id of the access connector"
}

variable "lakehouse_external_adls_path_landing_zone" {
  type        = string
  description = "The ADLS path of the landing zone"
}

variable "lakehouse_external_adls_path_bronze_zone" {
  type        = string
  description = "The ADLS path of the bronze zone"
}

variable "lakehouse_external_adls_path_silver_zone" {
  type        = string
  description = "The ADLS path of the silver zone"
}

variable "lakehouse_external_adls_path_gold_zone" {
  type        = string
  description = "The ADLS path of the gold zone"
}