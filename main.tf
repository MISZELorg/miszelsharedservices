module "resource_group_rg-runner-weu" {
  source              = "./rg"
  resource_group_name = var.resource_group_names["rg1"]
  location            = "westeurope"
}

module "resource_group_rg-runner-neu" {
  source              = "./rg"
  resource_group_name = var.resource_group_names["rg2"]
  location            = "northeurope"
}