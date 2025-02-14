provider "aws" {
  region = var.aws_region
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

module "aws_resources" {
  source = "./modules/aws"
}

module "azure_resources" {
  source = "./modules/azure"
}
