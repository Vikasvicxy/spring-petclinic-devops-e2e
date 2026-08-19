module "resource_group" {
  source = "./modules/resource-group"

  resource_group_name = "${var.project_name}-rg"
  location            = var.location
}


module "vnet" {
  source = "./modules/vnet"

  resource_group_name       = module.resource_group.resource_group_name
  location                  = var.location
  vnet_name                 = "${var.project_name}-vnet"
  address_space             = var.vnet_address_space
  aks_subnet_address_prefix = var.aks_subnet_address_prefix
}


module "storage" {
  source = "./modules/storage"

  resource_group_name  = module.resource_group.resource_group_name
  location             = var.location
  storage_account_name = var.storage_account_name
}


module "acr" {
  source = "./modules/acr"

  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  acr_name            = var.acr_name
}


module "container_apps" {
  source = "./modules/container-apps"

  resource_group_name = module.resource_group.resource_group_name
  location            = var.location

  container_app_name = "${var.project_name}-dev"

  image = "mcr.microsoft.com/azuredocs/containerapps-helloworld:latest"
}


module "aks" {
  source = "./modules/aks"

  resource_group_name = module.resource_group.resource_group_name
  location            = var.location

  aks_name   = "${var.project_name}-aks"
  dns_prefix = "${var.project_name}-aks"

  subnet_id = module.vnet.aks_subnet_id

  node_count = var.aks_node_count
  vm_size    = var.aks_vm_size
}
