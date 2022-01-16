resource "azurerm_virtual_network" "icecapbi-eastus2-dev-vnet-01" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "icecapbi-eastus2-dev-subnet-01" {
  name                                           = var.subnet_name
  resource_group_name                            = var.resource_group_name
  virtual_network_name                           = azurerm_virtual_network.icecapbi-eastus2-dev-vnet-01.name
  address_prefixes                               = var.subnet_address_prefixes
  enforce_private_link_service_network_policies  = true
  enforce_private_link_endpoint_network_policies = true
}

resource "azurerm_nat_gateway" "icecapbi-eastus2-dev-nat-01" {
  name                    = var.nat_gateway_name
  location                = var.resource_group_location
  resource_group_name     = var.resource_group_name
  sku_name                = "Standard"
  idle_timeout_in_minutes = 15
}

resource "azurerm_subnet_nat_gateway_association" "icecapbi-eastus2-dev-subnetnatassociation-01" {
  subnet_id      = azurerm_subnet.icecapbi-eastus2-dev-subnet-01.id
  nat_gateway_id = azurerm_nat_gateway.icecapbi-eastus2-dev-nat-01.id
}

