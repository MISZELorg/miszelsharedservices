resource "azurerm_resource_group" "ss-rgs" {
  for_each = var.rg_map
  name     = each.value.name
  location = each.value.location
}