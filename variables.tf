variable "location" {
  description = "The location/region where the resources should be created in."
  default     = "East US"
  type        = string
}


variable "azurerm_resource_group_name" {
    default = "azure-event-hub-rg"
    type = string
    description = "The name of the Container Group"
}

variable "azurerm_eventhub_namespace_name" {
    default = "azure-event-hub-ns"
    type = string
    description = "The name of the Container Group"
}

variable "azurerm_eventhub_name" {
    default = "azure-event-hub"
    type = string
    description = "The name of the Container Group"
}

variable "azurerm_storage_account_name" {
    default = "azureeventhubstorage"
    type = string
    description = "The name of the Container Group"
}

variable "azurerm_storage_container_name" {
    default = "azureeventhubcontainer"
    type = string
    description = "The name of the Container Group"
}