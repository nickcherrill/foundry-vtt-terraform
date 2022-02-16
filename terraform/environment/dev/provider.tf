# Configure the Microsoft Azure Provider
terraform {
	required_version = ">= 0.12"
	required_providers {
		azurerm = {
			source = "hasicorp/azurerm"
			version = ">= 2.4.1"
		}
	}
}

provider "azurerm" {
	features{}
}