# module "resource_group" {
#   source                  = "./modules/resource_group"
#   resource_group_name     = var.resource_group_name
#   resource_group_location = var.resource_group_location
# }

module "networking" {
  source                       = "./modules/networking"
  resource_group_name          = var.resource_group_name
  resource_group_location      = var.resource_group_location
  vnet_name                    = var.vnet_name
  vnet_address_space           = [var.vnet_address_space]
  subnet_name                  = var.subnet_name
  subnet_address_prefixes      = [var.subnet_address_prefixes]
  nat_gateway_name             = var.nat_gateway_name
}

module "storage_account" {
  source                  = "./modules/storage_account"
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
  storage_account_tier    = var.storage_account_tier
  storage_account_name    = var.storage_account_name
}

module "loadbalancer"{
  source                       = "./modules/loadbalancer"  
  load_balancer_public_ip_name = var.load_balancer_public_ip_name
  lb_name                      = var.lb_name
  lb_location                  = var.lb_location
  resource_group_name          = var.resource_group_name
  resource_group_location      = var.resource_group_location  
}


module "private_link_service" {
  source                                      = "./modules/private_link_service"
  private_link_service_name                   = var.private_link_service_name
  resource_group_name                         = var.resource_group_name
  resource_group_location                     = var.resource_group_location
  load_balancer_frontend_ip_configuration_ids = module.loadbalancer.load_balancer_frontend_ip_configuration_ids
  primary_private_ip_addr                     = var.primary_private_ip_addr
  subnet_id                                   = module.networking.subnet_id
}

module "private_endpoint" {
  source                  = "./modules/private_endpoint"
  private_endpoint_name   = var.private_endpoint_name
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
  subnet_id               = module.networking.subnet_id
  private_link_service_id = module.private_link_service.private_link_service_id
}
