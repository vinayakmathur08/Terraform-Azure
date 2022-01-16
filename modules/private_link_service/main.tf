
resource "azurerm_private_link_service" "icecapbi-eastus2-dev-pls-01" {
  name                = var.private_link_service_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  load_balancer_frontend_ip_configuration_ids = [var.load_balancer_frontend_ip_configuration_ids]

  nat_ip_configuration {
    name                       = "primary"
    private_ip_address         = var.primary_private_ip_addr
    private_ip_address_version = "IPv4"
    subnet_id                  = var.subnet_id
    primary                    = true
  }

}