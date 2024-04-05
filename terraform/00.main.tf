# 00.versions.tf

terraform {
  required_version = ">= 0.13"

  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = ">= 4.1.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = ">= 2.47.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.97.1"
    }
  }
}

# locals {
#   vault_root_token  = var.vault_root_token
#   vault_url         = var.vault_url
#   vault_port        = var.vault_port
#   vault_cli_port    = var.vault_cli_port
# }

provider "vault" {
  address = "${var.vault_url}"
#  address = "${var.vault_url}:${var.vault_port}"
#   token   = var.vault_root_token
#   skip_child_token = true
}

provider "azurerm" {
  #

}


provider "azuread" {
  #

}

resource "random_pet" "example" {
  #

}

