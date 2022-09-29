/*
resource "azurerm_resource_group" "virtual_network_resource_group" {
  name     = "dj-vnet-rg"
  location = var.location
}*/

resource "azurerm_virtual_network" "virtual_network" {
  name                = "dj-vnetwork"
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
}

resource "azurerm_subnet" "data_factory_subnet" {
  name                                           = var.environment_name == "test" ? join("-", [var.project_name, "datafactory", "subnet", var.environment_name]) : join("-", [var.project_name, "datafactory", "subnet"])
  resource_group_name                            = azurerm_resource_group.rg.name
  virtual_network_name                           = azurerm_virtual_network.virtual_network.name
  address_prefixes                               = [cidrsubnet("10.0.0.0/16", 8, 0)]
  enforce_private_link_endpoint_network_policies = true
  service_endpoints                              = ["Microsoft.Storage"]
}