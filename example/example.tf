
locals {

  msi_naming_convention_info = {
    name         = "001"
    project_code = "ml"
    env          = "de"
    zone         = "in"
    agency_code  = "boj"
    tier         = "pp"
  }

  tags = {
    createdBy = "Terraform"
    project   = "boj"
    Owner     = "BrettOJ"
  }

}

module "resource_groups" {
  source = "git::https://github.com/BrettOJ/tf-az-module-resource-group?ref=main"
  resource_groups = {
    1 = {
      name                   = var.resource_group_name
      location               = var.location
      naming_convention_info = local.naming_convention_info
      tags = {

      }
    }
  }
}

module "azure_user_assigned_identity" {
  source                 = "git::https://github.com/BrettOJ/tf-az-module-auth-user-msi?ref=main"
  resource_group_name    = module.resource_groups.rg_output[1].name
  location               = var.location
  naming_convention_info = local.msi_naming_convention_info
  tags = local.tags
}
