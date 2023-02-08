module "infrastructure-module" {

  source              = "./infrastructure-module"
  resource_group_name = "andreea-rg"

  //AKS vars
  aks_name         = "andreea-aks"
  aks_dns_prefix   = "andreea-prefix"
  aks_vm_size      = "Standard_B2s"
  aks_nodes_number = 1
  aks_nodepool_name = "default"

  //ACR vars
  sku_acr  = "Basic"
  acr_name = "acrandreea1898"

  //Ingress controler vars
  nginx_name      = "nginx-controller"
  nginx_namespace = "nginx-ns"

  //Cert manager vars
  certmanager_name      = "cert-manager"
  certmanager_namespace = "cert-manager-ns"
}

module "mysqlserver-module" {

  source              = "./mysqlserver-module"
  resource_group_name = "andreea-rg"

  mysql_server_name    = "mysql-server-andreea1898"
  mysql_admin_username = "andreea"
  mysql_admin_password = "1234qwer!"
  mysql_db_name        = "mysql-db-andreea1898"
  mysql_start_ip       = "188.27.84.135"
  mysql_end_ip         = "188.27.84.135"
  fw_name              = "fwrule-mysql"
}