
resource "azurerm_storage_account" "icecapbi-eastus2-dev-pls-01-sa-01" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
  account_tier             = var.storage_account_tier
  account_replication_type = "LRS"

  tags = {
    environment = "nonprod"
  }
}