**"infrastructure-module"** contains the following resources:
- Azure kubernetes cluster -aks
- Azure container registry -acr
- Helm chart for Nginx Ingress Controller 
- Helm chart for Cert-manager

**This module needs as prerequisites an already created Resource Group.**

The following variables are mandatory to be filled in for **"infrastructure-module"** module:

    source = "<path to module>"
    resource_group_name = "<name of the Resource group>"

    //AKS vars

    aks_name = "<kube cluster name>"
    aks_dns_prefix = "<dns prefix>"
    aks_vm_size = "<vm size - i.e. Standard_B2s>"
    aks_nodes_number = "<no of nodes - i.e 1>"
    aks_nodepool_name = "<node pool name>"

    //ACR vars
    sku_acr = "< acr tier i.e. Basic>"
    acr_name = "<container registry resource name>"

    //Ingress controler vars
    nginx_name = "<nginx ingress controller name>"
    nginx_namespace = "<nginx wanted namespace>"

    //Cert manager vars
    certmanager_name = "<cert-manager name>"
    certmanager_namespace = "<cert-manager wanted namespace>"
