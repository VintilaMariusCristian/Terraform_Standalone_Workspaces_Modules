
##aks cluster resource
resource "azurerm_kubernetes_cluster" "example" {
  name                = var.aks["aks-name"]
  location            = data.azurerm_resource_group.example.location
  resource_group_name = data.azurerm_resource_group.example.name
  dns_prefix          = var.aks["dns-prefix"]

  default_node_pool {
    name       = "default"
    node_count = "1"
    vm_size    = "standard_b2s"
  }

  identity {
    type = "SystemAssigned"
  }



}

## acr resource

resource "azurerm_container_registry" "acr" {
  name                = var.acr["name"]
  resource_group_name = data.azurerm_resource_group.example.name
  location            = data.azurerm_resource_group.example.location
  sku                 = var.acr["tier"]
  admin_enabled       = true
}

## public ip 


resource "azurerm_public_ip" "example" {
  name                = var.publicip["name"]
  resource_group_name = data.azurerm_resource_group.example.name
  location            = data.azurerm_resource_group.example.location
  allocation_method   = "Static"
  sku                 = var.publicip["sku"]

  tags = {
    environment = "Production"
  }
}


## A record 

resource "azurerm_dns_a_record" "example" {

  name                = var.arecord["name"]
  zone_name           = data.azurerm_dns_zone.example.name
  resource_group_name = data.azurerm_resource_group.example.name
  ttl                 = 300
  target_resource_id  = data.azurerm_public_ip.example.id

}

## MYSQL resource 

resource "azurerm_mysql_server" "example" {
  name                = var.mysql["name"]
  location            = var.mysql["location"]
  resource_group_name = data.azurerm_resource_group.example.name

  administrator_login          = "barbartadmin"
  administrator_login_password = "Marius2208@"

  sku_name   = "B_Gen5_1"
  storage_mb = 51200
  version    = "5.7"

  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = false
  infrastructure_encryption_enabled = false
  public_network_access_enabled     = true
  ssl_enforcement_enabled          = false
  ssl_minimal_tls_version_enforced  = "TLSEnforcementDisabled"
}

## MYSQL Firewall resource

resource "azurerm_mysql_firewall_rule" "example" {
  name                = var.mysqlfirewall["name"]
  resource_group_name = data.azurerm_resource_group.example.name
  server_name         = azurerm_mysql_server.example.name
  start_ip_address    = "82.76.85.238"
  end_ip_address      = "82.76.85.238"
}


## Ingress Controller -- helm-release

resource "helm_release" "ingress_nginx" {
  count    =var.cert_and_ingress ? 1 : 0
  name       = "ingress-nginx-controller"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = "4.0.6"

  namespace        = "ingress-basic"
  create_namespace = true

  values = [file("nginx_ingress_values.yaml")]


  set {
    name  = "controller.service.loadBalancerIP"
    value =  "${azurerm_public_ip.example.ip_address}"
   }

  depends_on = [azurerm_public_ip.example]

}

## Certmanager 

resource "helm_release" "cert_manager" {

  count    =var.cert_and_ingress ? 1 : 0
  name       = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  version    = "v1.7.1"
  namespace  = "ingress-basic"

  set {
    name  = "installCRDs"
    value = "true"
  }

depends_on = [azurerm_kubernetes_cluster.example]

}

## Cluster Issuer resource

resource "kubernetes_manifest" "letsencrypt_issuer" {
  provider = kubernetes
  count    =var.k8s_crds_enable ? 1 : 0
  manifest = yamldecode(<<-EOF
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: letsencrypt
spec:
  acme:
    server: https://acme-v02.api.letsencrypt.org/directory
    email: marius-cristian.vintila@endava.com
    privateKeySecretRef:
      name: letsencrypt
    solvers:
    - http01:
        ingress:
          class: nginx
          podTemplate:
            spec:
              nodeSelector:
                "kubernetes.io/os": linux
    EOF
  )

  depends_on = [data.azurerm_kubernetes_cluster.example]

}


#terraform plan -var=k8s_crds_enable=false

################### what I just modified 


# resource "azurerm_storage_account" "example" {
#   name                     = "terraform_storage_account"
#   resource_group_name      = data.azurerm_resource_group.example.name
#   location                 = data.azurerm_resource_group.example.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"

#   tags = {
#     environment = "staging"
#   }
# }

# resource "azurerm_storage_container" "example" {
#   name                  = "terraform_state"
#   storage_account_name  = azurerm_storage_account.example.name
#   container_access_type = "private"
# }

################# my modifications