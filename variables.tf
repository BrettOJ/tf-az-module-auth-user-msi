
variable "location" {}
variable "resource_group_name" {}

variable "naming_convention_info" {
  description = "(Required) Specify the naming convention information to the resource."
  type = object({
    name         = string
    site         = string
    env          = string
    app          = string
  })
}

variable "tags" {
  type        = map(string)
  description = "Specify the tags to the resource. Additional tags will be appended based on the convention"
}
