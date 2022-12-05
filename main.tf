terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.32.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.16.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
}

provider "kubernetes" {
  config_path = "/root/.kube/kubeconfig-${var.clusterName}.yml"
  # Configuration options
}