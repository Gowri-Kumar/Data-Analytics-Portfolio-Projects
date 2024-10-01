//AZ tenancy and subscription details
variable "az_tenant_id" { default = "81835726-6e9e-4770-8bb6-6c292f2fef3d" }
variable "az_subscription_id" { default = "f5db8d12-ebce-4e7d-b62c-6e149c62749b" }
variable "az_location" { default = "Australia East" }

//AZ project specifics
variable "rg_name { default = "data-analytics-portfolio-project-rg" }
variable "resource_name_suffix" { default = "dapp00" }

