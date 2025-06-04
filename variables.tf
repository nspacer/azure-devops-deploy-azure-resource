variable "resource_group_name" {
  type        = string
  description = "Name of the resource group provided by the lab."
  default     = "AzureResourceGroup"
}

variable "naming_prefix" {
  description = "Prefix to use for naming of resources."
  type        = string
  default     = "nacho"
}

variable "common_tags" {
  description = "Map of tags to apply to all resources."
  type        = map(string)
  default = {
    "Environment" = "development"
    "Application" = "TacoWagon"
  }
}

variable "vnet_address_space" {
  description = "List of address spaces to use for the VNET."
  type        = list(string)
  default     = ["10.43.0.0/16"]
}

variable "subnet_configuration" {
  description = "Map of subnets to create in the VNET. Key is subnet name, value is address spaces."
  type        = map(string)
  default = {
    web = "10.43.0.0/24"
    app = "10.43.1.0/24"
  }
}
