output "rg_dns"{

value={ 
 dns_zone  = data.azurerm_dns_zone.example
 resource_group_name = data.azurerm_resource_group.example
  }

}



output "kubeconfig_output" {
  value = data.azurerm_kubernetes_cluster.example.kube_config_raw
  sensitive=true
  
}


# resource "local_file" "kubeconfig" {

#   filename     = "kubeconfig"
#   content      = azurerm_kubernetes_cluster.example.kube_config_raw
  

# }



output "host" {
  value = azurerm_kubernetes_cluster.example.kube_config.0.host
  sensitive=true
  
}


output "kube_config" {
  value = azurerm_kubernetes_cluster.example.kube_config_raw
  sensitive=true
  
}


output "principal_id" {
  value = data.azurerm_kubernetes_cluster.example.identity
  sensitive=true
  
}
