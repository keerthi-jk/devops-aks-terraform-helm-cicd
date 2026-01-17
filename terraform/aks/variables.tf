variable "rg" {
    description = "azure resource group"
    type = string
    default = "AZAKSTesting-rg"
}
variable "location" {
    description = "Azure Region"
    type = string
    default = "East Us"
}

variable "aks_name" {
    description = "AKS Cluster Name"
    type = string
    default = "devops-aks"

}

variable "node_count" {
    description = "number of AKS nodes"
    type = number
    default = 1
}