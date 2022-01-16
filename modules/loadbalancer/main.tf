resource "azurerm_public_ip" "icecapbi-eastus2-loadbalancerip-01" {
  name                = var.load_balancer_public_ip_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_lb" "icecapbi-eastus2-loadbalancer-01" {
  name                = var.lb_name
  sku                 = "Standard"
  location            = var.lb_location
  resource_group_name = var.resource_group_name
  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.icecapbi-eastus2-loadbalancerip-01.id
  }
}