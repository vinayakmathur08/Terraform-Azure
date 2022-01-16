resource "azurerm_private_endpoint" "icecapbi-eastus2-dev-pe-01" {
  name                = var.private_endpoint_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "privateserviceconnection"
    private_connection_resource_id = var.private_link_service_id
    is_manual_connection           = false
  }
}