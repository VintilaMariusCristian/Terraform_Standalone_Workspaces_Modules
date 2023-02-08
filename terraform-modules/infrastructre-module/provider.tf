terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = "2.7.1"
    }
    }
}


provider "helm" {
  debug = true
  kubernetes {
    host                   = data.azurerm_kubernetes_cluster.test.kube_config[0].host
    client_key             = base64decode(data.azurerm_kubernetes_cluster.test.kube_config[0].client_key)
    client_certificate     = base64decode(data.azurerm_kubernetes_cluster.test.kube_config[0].client_certificate)
    cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.test.kube_config[0].cluster_ca_certificate)
  }
}
