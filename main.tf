module "runner-neu" {
  source = "./neu"
}

module "runner-weu" {
  source = "./weu"
}

module "rbac" {
  source               = "./roleassignment"
  role_definition_name = "Key Vault Administrator"
  principal_id         = var.spn_admin
  principal_type       = "ServicePrincipal"
  scope                = module.runner-neu.rg_id
  depends_on           = [module.runner-neu]
}

module "rbac2" {
  source               = "./roleassignment"
  role_definition_name = "Key Vault Administrator"
  principal_id         = var.spn_reader
  principal_type       = "ServicePrincipal"
  scope                = module.runner-neu.rg_id
  depends_on           = [module.runner-neu]
}

module "rbac3" {
  source               = "./roleassignment"
  role_definition_name = "Key Vault Crypto Service Encryption User"
  principal_id         = var.spn_admin
  principal_type       = "ServicePrincipal"
  scope                = module.runner-neu.rg_id
  depends_on           = [module.runner-neu]
}

module "kv" {
  source         = "./keyvault"
  location       = "northeurope"
  github_runners = var.github_runners
  rg_name        = module.runner-neu.resource_group_name
  kv_sku_name    = "standard"
  kv_name        = var.kv_name
  depends_on = [
    module.rbac,
    module.rbac2,
    module.rbac3
  ]
}