resource "azurerm_resource_group" "rg" {
  for_each = {
    runner-weu = "westeurope"
    runner-neu = "northeurope"
  }
  name     = "rg-${each.key}"
  location = each.value
}