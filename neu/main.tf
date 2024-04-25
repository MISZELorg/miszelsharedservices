module "rg" {
  source              = "./rg"
  resource_group_name = "rg-runner-neu"
  location            = "northeurope"
}

module "vnet" {
  source              = "./vnet"
  resource_group_name = module.rg.resource_group_location
  vnet_name           = "vnet-neu"
  address_space       = ["10.0.0.0/16"]
  subnet_name         = "default"
  subnet_prefixes     = ["10.0.0.0/24"]
  nsg_name            = "nsg-weu"
  location            = module.rg.resource_group_location
}