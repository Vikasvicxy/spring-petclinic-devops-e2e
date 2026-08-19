variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "location" {
  type    = string
  default = "Central India"
}

variable "project_name" {
  type    = string
  default = "petclinic"
}

variable "vnet_address_space" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}

variable "aks_subnet_address_prefix" {
  type    = string
  default = "10.0.1.0/24"
}

variable "storage_account_name" {
  type = string
}

variable "acr_name" {
  type = string
}

variable "aks_node_count" {
  type    = number
  default = 1
}

variable "aks_vm_size" {
  type    = string
  default = "Standard_D2s_v5"
}
