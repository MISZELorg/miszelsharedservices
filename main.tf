module "rg-weu" {
  source   = "./rg"
  rg_name  = var.rg-weu-name
  location = "westeurope"
}

module "rg-neu" {
  source   = "./rg"
  rg_name  = var.rg-neu-name
  location = "northeurope"
}

module "laws-weu" {
  source    = "./laws"
  location  = module.rg-weu.location
  rg_name   = module.rg-weu.rg_name
  logs_name = var.laws-weu_name
}

module "laws-neu" {
  source    = "./laws"
  location  = module.rg-neu.location
  rg_name   = module.rg-neu.rg_name
  logs_name = var.laws-neu_name
}

