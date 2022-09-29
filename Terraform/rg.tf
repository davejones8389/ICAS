resource "azurerm_resource_group" "rg" {
  name     = "dj-rg-poc"
  location = var.location
}