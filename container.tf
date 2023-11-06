resource "azurerm_storage_account" "azurerm_storage_account" {
  name                     = var.azurerm_storage_account_name
  resource_group_name      = azurerm_resource_group.resource_group.name
  location                 = azurerm_resource_group.resource_group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "azurerm_storage_container" {
  name                  = var.azurerm_storage_container_name
  storage_account_name  = azurerm_storage_account.azurerm_storage_account.name
  container_access_type = "private"
}

resource "azurerm_role_assignment" "azurerm_role_assignment_storage" {
  principal_id   = data.azurerm_client_config.current.object_id
  role_definition_name = "Storage Blob Data Contributor"
  scope         = azurerm_storage_account.azurerm_storage_account.id
}

output "BLOB_STORAGE_ACCOUNT_URL" {
    value = azurerm_storage_account.azurerm_storage_account.primary_blob_endpoint
}

output "BLOB_CONTAINER_NAME" {
    value = azurerm_storage_container.azurerm_storage_container.name
}

output "EVENT_HUB_NAMESPACE_NAME"{
    value = azurerm_eventhub_namespace.azurerm_eventhub_namespace.name
}