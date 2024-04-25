module "resource_group_rg1" {
  source              = "./rg"
  resource_group_name = var.resource_group_names["rg1"]
  location            = var.location
}

module "vnet_module" {
  source              = "./vnet"
  vnet_name           = "vnet-runner-neu"
  subnet_name         = "default"
  address_space       = ["10.0.0.0/16"]
  subnet_prefixes     = ["10.0.0.0/24"]
  nsg_name            = "nsg-runner-neu"
  resource_group_name = module.resource_group_rg1.resource_group_name
  resource_group      = module.resource_group_rg1.resource_group
  location            = var.location
}