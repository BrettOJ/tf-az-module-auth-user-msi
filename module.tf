resource "azurerm_user_assigned_identity" "msi_obj" {
  resource_group_name = var.resource_group_name
  location            = var.location
  name                = module.msi_name.naming_convention_output[var.naming_convention_info.name].names.0
}