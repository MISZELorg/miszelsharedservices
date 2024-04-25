module "resgroups" {
  source = "./rg"
}

module "laws" {
  source     = "./laws"
  location   = module.resgroups.location
  rg_name    = module.resgroups.name
  logs_name  = "logs"
  depends_on = [module.resgroups]
}