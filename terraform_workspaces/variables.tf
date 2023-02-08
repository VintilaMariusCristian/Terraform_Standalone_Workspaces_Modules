locals{

   rg-name= {
     default = "TerraformVintila"
     dev     = "TerraformVintila-dev"

   }

   
   aks-name = {

      default = "vtf-aks" 
      dev     = "vtf-aks-dev"
    }

    dns-prefix = {
     
     default = "vtf-aks"
     dev     = "vtf-aks-dev"

    }

    dns-zone-name = {
     default = "schrodingerpuppy.barbart.ro"
     dev     = "schrodingerpuppy.barbart.ro"

    }


    mysql-name = {
     default = "tfvintilabarbart"
     dev     = "tfvintilabarbartdev"

    }


    arecord-name = {
     default = "aks"
     dev     = "aksdev"

    }

    acr-name = {
     default = "vintilaterraform"
     dev     = "vintilaterraformdev"

    }



}

#########################################################################################################3

variable "zone-name"{
  
type= string 
default = "schrodingerpuppy.barbart.ro"

}

variable "main-rg-name"{
  
type= string 
default = "TerraformVintila"

}







#########################################################################################################

## aks variables

# variable "aks"{
  
# type= map 
# default = {

#    "aks-name"   = "vtf-aks" 
#    "dns-prefix" = "vtf-aks"
# }

# }


## acr variables

variable "acr"{
  
type= map 
default = {
   "tier" = "Standard"
 
}

}


## A record variables


## PublicIp variables

variable "publicip"{
  
type= map 
default = {

   "name"   = "publicip"
   "sku"    = "Standard"
 
}

}

## MYSQL variables


variable "mysql-location"{
  
type= map 
default = {

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


