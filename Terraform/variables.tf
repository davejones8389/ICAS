variable "tenant_id" {
  type        = string
  description = "The Azure tenant id which contains the target subscription."
  default = "a4d4d5cd-20cf-444e-bfe7-3d3ecef3fe94"
}

variable "subscription_id" {
  type        = string
  description = "The subscription id to deploy resource into."
  default = "edb776c0-b5bb-40b3-aab5-c163c05da0d1"
}

variable "location" {
  type        = string
  description = "The Azure location to deploy resources."
  default     = "uksouth"
}

variable "project_name" {
  type        = string
  description = "The name of the project being deployed."
  default = "icas"
}

variable "environment_name" {
  type        = string
  description = "The name of the environment."
  default     = ""
}

variable "environment" {
  type        = string
  description = "The name of the environment."
  default     = ""
}

variable "adf_name" {
  type        = list(string)
  description = "A list of public ip addresses allowed access to keyvault."
  default     = "dj-adf31842389t2jwg"
}

variable "allowed_key_vault_ips" {
  type        = list(string)
  description = "A list of public ip addresses allowed access to keyvault."
  default     = []
}

variable "sql_server_alert_email_addresses" {
  type        = list(string)
  description = "A list of email address to send SQL security alerts to."
  default     = ["UK-DLInfrastructureConnectedCustomer@kpmg.co.uk"]
}
 

variable "sql_database_sku" {
  type        = string
  description = "The sku to use for the sql databases."
  default     = "S0"
}

variable "allowed_storage_account_ips" {
  type        = list(string)
  description = "A list of public ip addresses allowed access to various storage accounts."
  default     = []
}


variable "enable_hns_storage_account" {
  type        = bool
  description = "If hsts needs to be enabled for the storage account"
  default     = false
}