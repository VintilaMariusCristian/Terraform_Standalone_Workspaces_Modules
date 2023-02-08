variable "aks_name" {
  type        = string
  description = "aks name"
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