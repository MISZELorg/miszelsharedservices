resource "azurerm_resource_group" "rg" {
  for_each = {
    rg1 = "westeurope"
    rg2 = "northeurope"
  }
  name     = each.key
  location = each.value
}