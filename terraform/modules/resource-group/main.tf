# Deploy a Resource Group with Azure resources.
#
# For suggested naming conventions, refer to:
#   https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/naming-and-tagging

# Main resource group

resource "azurerm_resource_group" "core" {
  	name     = "rg-${var.appname}-${var.environment}-core"
  	location = var.location
	tags     = {
		appname = var.appname
		designer = var.designer
    	department = var.department
		environment = var.environment
		deployedOn = formatdate("EEEE, DD 'of' MMMM, YYYY", timestamp())
	}
}