output "tenantid" {
  value = data.azurerm_client_config.current.tenant_id
}

output "keyvault_id" {
  value = azurerm_key_vault.key_vault.id
}

output "password" {
  value     = azurerm_key_vault_secret.password
  sensitive = true
}

output "username" {
  value     = azurerm_key_vault_secret.username
  sensitive = true
}