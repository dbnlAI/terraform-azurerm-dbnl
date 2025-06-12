locals {
  instance_types = tomap({
    small = {
      database   = "GP_Standard_D2s_v3"
      kubernetes = "Standard_E4s_v5"
      redis = {
        sku_name = "Standard"
        family   = "C"
        capacity = "3"
      }
    }
    medium = {
      database   = "GP_Standard_D8s_v3"
      kubernetes = "Standard_E8s_v5"
      redis = {
        sku_name = "Standard"
        family   = "C"
        capacity = "4"
      }
    }
  })
}