## aks variables

variable "aks"{
  
type= map 
default = {

   "aks-name"   = "vtf-aks" 
   "dns-prefix" = "vtf-aks"
 
}

}


## acr variables

variable "acr"{
  
type= map 
default = {

   "name"   = "vintilaterraform"
   "tier" = "Standard"
 
}

}


## A record variables

variable "arecord"{
  
type= map 
default = {

   "name"   = "aks"
 
}

}

## PublicIp variables

variable "publicip"{
  
type= map 
default = {

   "name"   = "publicip"
   "sku"    = "Standard"
 
}

}

## MYSQL variables


variable "mysql"{
  
type= map 
default = {

    "name"       = "tfvintilabarbart"
    "location"   = "eastus"
 
}

}

##MYSQL Firewall variables


variable "mysqlfirewall"{
  
type= map 
default = {

    "name"       = "agent_connection"

 
}

}



variable "k8s_crds_enable"{
  
type= bool
default = true
}


variable "cert_and_ingress"{
  
type= bool
default = true
}


