module "resource_group_rg-runner-weu" {
  source              = "./resource_group"
  resource_group_name = var.resource_group_names["rg1"]
  location            = "westeurope"
}

module "resource_group_rg-runner-neu" {
  source              = "./resource_group"
  resource_group_name = var.resource_group_names["rg2"]
  location            = "northeurope"
}