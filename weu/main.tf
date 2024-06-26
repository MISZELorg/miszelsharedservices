module "rg" {
  source              = "./rg"
  resource_group_name = "rg-runner-weu"
  location            = "westeurope"
}

module "vnet" {
  source              = "./vnet"
  resource_group_name = module.rg.resource_group_name
  vnet_name           = "vnet-weu"
  address_space       = ["20.0.0.0/16"]
  subnet_name         = "default"
  subnet_prefixes     = ["20.0.0.0/24"]
  nsg_name            = "nsg-weu"
  location            = module.rg.resource_group_location
}