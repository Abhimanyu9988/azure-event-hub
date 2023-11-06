terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.78.0"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

data "azurerm_client_config" "current" {}

output "current_user_principal_id" {
  value = data.azurerm_client_config.current.object_id
}

resource "azurerm_role_assignment" "eventhub_data_owner" {
  principal_id = data.azurerm_client_config.current.object_id  # Use your principal_id here
  role_definition_name = "Azure Event Hubs Data Owner"
  scope               = azurerm_eventhub_namespace.azurerm_eventhub_namespace.id
}

resource "azurerm_role_assignment" "data_sender" {
  principal_id   = data.azurerm_client_config.current.object_id  # The Azure AD object ID of the user, group, or service principal
  role_definition_name = "Azure Event Hubs Data Sender"
  scope         = azurerm_eventhub_namespace.azurerm_eventhub_namespace.id
}

resource "azurerm_role_assignment" "data_receiver" {
  principal_id   = data.azurerm_client_config.current.object_id  # The Azure AD object ID of the user, group, or service principal
  role_definition_name = "Azure Event Hubs Data Receiver"
  scope         = azurerm_eventhub_namespace.azurerm_eventhub_namespace.id
}

resource "azurerm_resource_group" "resource_group" {
  name     = var.azurerm_resource_group_name
  location = var.location
}

resource "azurerm_eventhub_namespace" "azurerm_eventhub_namespace" {
  name                = var.azurerm_eventhub_namespace_name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  sku                 = "Standard"
  capacity            = 1
}

resource "azurerm_eventhub" "azurerm_eventhub" {
  name                = var.azurerm_eventhub_name
  namespace_name      = azurerm_eventhub_namespace.azurerm_eventhub_namespace.name
  resource_group_name = azurerm_resource_group.resource_group.name
  partition_count     = 2
  message_retention   = 1
}



output "resource_group_name" {
  value = azurerm_resource_group.resource_group.name
}

output "EVENT_HUB_FULLY_QUALIFIED_NAMESPACE" {
  value = azurerm_eventhub_namespace.azurerm_eventhub_namespace.default_primary_connection_string
  sensitive = true
}

output "EVENT_HUB_NAME" {
  value = azurerm_eventhub.azurerm_eventhub.name
}