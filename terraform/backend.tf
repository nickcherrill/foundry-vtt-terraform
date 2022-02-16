
#Set the terraform backend
terraform {
  # Backend variables are initialized by Azure DevOps
	backend "remote" {
		resource_group_name   = "rg-tfstate-prod-persistent"
		storage_account_name  = "foundrytfstate"
		container_name        = "tfstate"
		key                   = "terraform.tfstate"
	}
}