data "azurerm_resource_group" "example"{

    name=local.rg-name[terraform.workspace]

}


data "azurerm_dns_zone" "example"{

  name="schrodingerpuppy.barbart.ro"
  resource_group_name= var.main-rg-name

}


data "azurerm_public_ip" "example" {
  name                = azurerm_public_ip.example.name
  resource_group_name = data.azurerm_resource_group.example.name
}



data "azurerm_kubernetes_cluster" "example" {
  name                = local.aks-name[terraform.workspace]
  resource_group_name = data.azurerm_resource_group.example.name
  depends_on = [azurerm_kubernetes_cluster.example]
}

####### my addons delete 

# data "azurerm_storage_container" "example" {

# }

