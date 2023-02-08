// ACR resource

resource "azurerm_container_registry" "test" {
  name                = var.acr_name
  resource_group_name = data.azurerm_resource_group.test.name
  location            = data.azurerm_resource_group.test.location
  sku                 = var.sku_acr
  admin_enabled       = false
}

//AKS resource

resource "azurerm_kubernetes_cluster" "test" {
  name                = var.aks_name
  location            = data.azurerm_resource_group.test.location
  resource_group_name = data.azurerm_resource_group.test.name
  dns_prefix          = var.aks_dns_prefix

  default_node_pool {
    name       = var.aks_nodepool_name
    node_count = var.aks_nodes_number
    vm_size    = var.aks_vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "DEV"
  }
}

// Helm - install ingress controller- resource

resource "helm_release" "ingress" {
  depends_on       = [data.azurerm_kubernetes_cluster.test]
  name             = var.nginx_name
  repository       = "https://kubernetes.github.io/ingress-nginx/"
  chart            = "ingress-nginx"
  namespace        = var.nginx_namespace
  create_namespace = true
}

// Helm - install cert-manager- resource

resource "helm_release" "cert_manager" {
  depends_on       = [data.azurerm_kubernetes_cluster.test]
  name             = var.certmanager_name
  repository       = "https://charts.jetstack.io"
  chart            = "cert-manager"
  version          = "v1.7.1"
  namespace        = var.certmanager_namespace
  create_namespace = true

  set {
    name  = "installCRDs"
    value = "true"
  }
}





