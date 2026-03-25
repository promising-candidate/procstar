terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

variable "commenter" {
  description = "The name of the resource group"
  type        = string
  nullable = false
}


resource "azurerm_resource_group" "rg" {
  name     = "rg-student-${var.commenter}"
  location = "westus2"
}
