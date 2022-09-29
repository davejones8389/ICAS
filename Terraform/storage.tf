resource "azurerm_storage_account" "landing_storage_account" {
  name                      = "davejstorageaccount8389"
  resource_group_name       = azurerm_resource_group.rg.name
  location                  = azurerm_resource_group.rg.location
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "GRS"
  access_tier               = "Hot"
  enable_https_traffic_only = true
  is_hns_enabled            = var.enable_hns_storage_account
  min_tls_version           = "TLS1_2"
  allow_blob_public_access  = false

  network_rules {
    default_action = "Allow"
    bypass         = ["Logging", "Metrics", "AzureServices"]
    ip_rules       = var.allowed_storage_account_ips
  }

  identity {
    type = "SystemAssigned"
  } 
}