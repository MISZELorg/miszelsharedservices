module "rg" {
  source              = "./rg"
  resource_group_name = "rg-runner-weu"
  location            = "westeurope"
}