module "resgroups" {
  source = "./rg"
}

module "laws" {
  source    = "./laws"
  location  = module.rg.location
  rg_name   = module.rg.name
  logs_name = "logs"
}