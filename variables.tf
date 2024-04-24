variable "rg_map" {
  type = map(object({
    name     = string
    location = string
  }))
  default = {
    "rg-runner-weu" = {
      name     = "rg-runner-weu"
      location = "westeurope"
    }
    "rg-runner-neu" = {
      name     = "rg-runner-neu"
      location = "northeurope"
    }
  }
}