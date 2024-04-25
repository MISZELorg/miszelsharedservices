resource "azurerm_resource_group" "rg-kv" {
  name     = var.rg_name
  location = var.location

  tags = local.tags
}

resource "azurerm_key_vault" "key_vault" {
  name                            = var.kv_name
  location                        = var.location
  resource_group_name             = var.rg_name
  tenant_id                       = data.azurerm_client_config.current.tenant_id
  enabled_for_disk_encryption     = true
  enabled_for_deployment          = false
  enabled_for_template_deployment = true
  enable_rbac_authorization       = true
  soft_delete_retention_days      = 90
  purge_protection_enabled        = true
  sku_name                        = var.kv_sku_name
  public_network_access_enabled   = true

  network_acls {
    bypass                     = "AzureServices"
    default_action             = "Deny"
    virtual_network_subnet_ids = []
    ip_rules                   = var.github_runners
  }

}

resource "azurerm_key_vault_secret" "username" {
  name         = "username"
  value        = "kmiszel"
  key_vault_id = azurerm_key_vault.key_vault.id
  depends_on = [
    azurerm_key_vault.key_vault
  ]
}

resource "random_password" "password" {
  length  = 20
  special = false
  depends_on = [
    azurerm_key_vault.key_vault
  ]
}

resource "azurerm_key_vault_secret" "password" {
  name         = "password"
  value        = random_password.password.result
  key_vault_id = azurerm_key_vault.key_vault.id
  depends_on = [
    random_password.password
  ]
}