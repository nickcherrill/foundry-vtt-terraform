# Deploy a storage account for tfstate
#
# For suggested naming conventions, refer to:
#   https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/naming-and-tagging

# Random name

resource "random_string" "resource_code" {
	length  = 5
	special = false
	upper   = false
}

# Storage account

resource "azurerm_storage_account" "tfstate" {
	name                     = "tfstate${random_string.resource_code.result}"
	resource_group_name      = azurerm_resource_group.core.name
	location                 = azurerm_resource_group.core.location
	account_tier             = "Standard"
	account_replication_type = "LRS"
	allow_blob_public_access = true

	tags     = {
		appname = var.appname
		designer = var.designer
		department = var.department
		environment = var.environment
		deployedOn = formatdate("EEEE, DD 'of' MMMM, YYYY", timestamp())
	}
}

# Blob container

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "blob"
}