data "azurerm_resource_group" "test" {
  name = var.resource_group_name
}

data "azurerm_kubernetes_cluster" "test" {
  name                = azurerm_kubernetes_cluster.test.name
  resource_group_name = data.azurerm_resource_group.test.name

  depends_on = [azurerm_kubernetes_cluster.test]
}