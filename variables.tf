variable "resource_group_names" {
  description = "A map of resource group names to create."
  type        = map(string)
}

variable "locations" {
  description = "AZ resource locations"
  type        = map(string)
}