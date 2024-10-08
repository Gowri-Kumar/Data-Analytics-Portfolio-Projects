//AZ tenancy and subscription details
variable "az_tenant_id" { default = "81835726-6e9e-4770-8bb6-6c292f2fef3d" }
variable "az_subscription_id" { default = "f5db8d12-ebce-4e7d-b62c-6e149c62749b" }
variable "az_location" { default = "Australia East" }

//terraform application service principal
// creds for registered terraform app in app registrations - https://portal.azure.com/?azure-portal=true%5D#view/Microsoft_AAD_RegisteredApps/ApplicationsListBlade
variable "client_id" { default = "b0a56793-c042-4f0b-a12a-5de8fc638b08"}
variable "client_secret" { default = "7Qh8Q~E0CYYCKui43x0x4Q_35CNGT_Jffncgpa9g" }

//AZ project specifics
variable "rg_name" { default = "data-analytics-portfolio-project-rg" }

# Databricks Variables
variable "db_ws_sp_token" { default = "dapi2984244a0de8b823722538385a3f0090" }
variable "account_id" { default = "15365ebb-5d28-41bf-981f-d8ea3a86e8bd" }
# Manual step - Provide account admin role to terraform sp in datarbicks account console. 
