// Resource group

variable "resource_group_name" {
  type        = string
  description = "Resource Group name"
}


// AKS vars
variable "aks_name" {
  type        = string
  description = "AKS name"
}

variable "aks_dns_prefix" {
  type        = string
  description = "AKS DNS prefix"
}

variable "aks_vm_size" {
  type        = string
  description = "AKS vm sku"
}

variable "aks_nodes_number" {
  type        = number
  description = "AKS nodes number"
}

variable "aks_nodepool_name" {
  type        = string
  description = "AKS nodes pool name"
}



//ACR vars
variable "sku_acr" {
  type        = string
  description = "ACR sku"
}

variable "acr_name" {
  type        = string
  description = "ACR name"
}


//Ingress controler vars
variable "nginx_name" {
  type        = string
  description = "Nginx ingress controller resource name"
}

variable "nginx_namespace" {
  type        = string
  description = "Nginx ingress controller namespace name"
}


//Cert manager vars
variable "certmanager_name" {
  type        = string
  description = "Cert manager resource name"
}

variable "certmanager_namespace" {
  type        = string
  description = "Cert manager namespace name"
}