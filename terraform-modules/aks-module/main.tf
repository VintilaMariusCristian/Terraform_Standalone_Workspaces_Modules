resource "azurerm_kubernetes_cluster" "aks-andreea" {
  name                = var.aks_name
  location            = data.azurerm_resource_group.andreea-rg.location
  resource_group_name = data.azurerm_resource_group.andreea-rg.name
  dns_prefix          = var.aks_dns_prefix

  default_node_pool {
    name       = "default"
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