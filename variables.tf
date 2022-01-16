#ResourceGroup
variable "resource_group_name" {}
variable "resource_group_location" {}
#StorageAccount
variable "storage_account_name" {}
variable "storage_account_tier" {}
#PrivateLinkService
variable "private_link_service_name" {}
variable "primary_private_ip_addr"{}
#PrivateEndpoint
variable "private_endpoint_name" {}
#Networking
variable "vnet_name" {}
variable "vnet_address_space" {}
variable "subnet_name" {}
variable "subnet_address_prefixes" {}
variable "nat_gateway_name" {}
variable "lb_name" {}
variable "lb_location" {}
variable "load_balancer_public_ip_name"{}