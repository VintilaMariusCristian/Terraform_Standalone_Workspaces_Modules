# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
######## addons 
  backend "azurerm" {
    resource_group_name = "TerraformVintila"
    storage_account_name = "terraformvintila"
    container_name = "terraformstate"
    key = "terraform.tfstate"
    access_key = "Gy9Z3S8EbLUTPhlmiQ2OjzxNsvetRQm7jwHqVIMvffopQ2rXo42nAxTqPl4WQJfqzMXNncRZU7Mk+AStPMxzdw=="
  }



######## finished addons 

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}


provider "helm" {
    
  kubernetes {
  host                   = azurerm_kubernetes_cluster.example.kube_config.0.host
  username               = azurerm_kubernetes_cluster.example.kube_config.0.username
  password               = azurerm_kubernetes_cluster.example.kube_config.0.password
  client_certificate     = base64decode(azurerm_kubernetes_cluster.example.kube_config.0.client_certificate)
  client_key             = base64decode(azurerm_kubernetes_cluster.example.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.example.kube_config.0.cluster_ca_certificate)
  }

}

/*
provider "kubernetes" {

  
  host                   = data.azurerm_kubernetes_cluster.example.kube_config.0.host
  username               = data.azurerm_kubernetes_cluster.example.kube_config.0.username
  password               = data.azurerm_kubernetes_cluster.example.kube_config.0.password
  client_certificate     = base64decode(data.azurerm_kubernetes_cluster.example.kube_config.0.client_certificate)
  client_key             = base64decode(data.azurerm_kubernetes_cluster.example.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.example.kube_config.0.cluster_ca_certificate)


}
*/

provider "kubernetes" {

  
  host                   = azurerm_kubernetes_cluster.example.kube_config.0.host
    username               = azurerm_kubernetes_cluster.example.kube_config.0.username
  password               = azurerm_kubernetes_cluster.example.kube_config.0.password
  client_certificate     = base64decode(azurerm_kubernetes_cluster.example.kube_config.0.client_certificate)
  client_key             = base64decode(azurerm_kubernetes_cluster.example.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.example.kube_config.0.cluster_ca_certificate)
  experiments {
    manifest_resource=true
  }

}

