output "load_balancer_frontend_ip_configuration_ids" {
  value = azurerm_lb.icecapbi-eastus2-loadbalancer-01.frontend_ip_configuration[0].id
}