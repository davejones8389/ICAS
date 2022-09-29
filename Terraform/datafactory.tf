
resource "azurerm_data_factory" "data_factory" {
  name                = "dj-adf31842389t2jwg"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  identity {
    type = "SystemAssigned"
  }

  github_configuration {
    account_name    = "djones8389"
    branch_name     = "main"
    git_url         = "https://github.com"
    repository_name = "ICAS"
    root_folder     = "/"
  }
  
  public_network_enabled = true

  #checkov:skip=CKV_AZURE_103:Not sure if github integration is required yet
}
 
 resource "azurerm_data_factory_linked_service_azure_blob_storage" "example" {
  name              = "Storage"
  #data_factory_id   = azurerm_data_factory.data_factory.id
  connection_string = azurerm_storage_account.landing_storage_account.primary_connection_string
  resource_group_name = azurerm_resource_group.rg.name
  data_factory_name = azurerm_data_factory.data_factory.name
}
// Networking


resource "azurerm_private_dns_zone" "data_factory_private_dns_zone" {
  name                = join(".", ["privatelink", azurerm_resource_group.rg.location, "datafactory.azure.net"])
  resource_group_name = azurerm_resource_group.rg.name
}


resource "azurerm_private_endpoint" "data_factory_private_endpoint" {
  name                = join("-", [var.project_name, "datafactory", "endpoint"])
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  subnet_id           = azurerm_subnet.data_factory_subnet.id

  private_dns_zone_group {
    name                 = join("-", [var.project_name, "datafactory"])
    private_dns_zone_ids = [azurerm_private_dns_zone.data_factory_private_dns_zone.id]
  }

  private_service_connection {
    name                           = join("-", [azurerm_data_factory.data_factory.name, "private", "connection"])
    is_manual_connection           = false
    private_connection_resource_id = azurerm_data_factory.data_factory.id
    subresource_names              = ["dataFactory"]
  }
}


/*

resource "azurerm_data_factory_pipeline" "test" {
  name            = "test"
  data_factory_name = azurerm_data_factory.data_factory.name
  resource_group_name = azurerm_resource_group.rg.name
  variables = {
    "bob" = "item1"
  }
  
}
*/