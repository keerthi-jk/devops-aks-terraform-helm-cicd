data "azurerm_resource_group" "rg" { 
    #go find existing resource group of below name don't create anything new 
    name = var.rg
}

#create AKS cluster 
resource "azurerm_kubernetes_cluster" "aks" {
    name = var.aks_name
    location = data.azurerm_resource_group.rg.location
    resource_group_name = data.azurerm_resource_group.rg.name
    dns_prefix = "devopsaks"

    default_node_pool {
        name = "nodepool1"
        node_count = var.node_count
        vm_size = "standard_dc2as_v5"
    }

    # System-assigned Managed Identity (AKS → Azure resources)
    identity {
        type = "SystemAssigned"
    }

    role_based_access_control_enabled = true

    network_profile {
        network_plugin = "azure"
    }

  

}